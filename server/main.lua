local Ox = require '@ox_core/lib/init'

lib.callback.register('ox_invoice:create', function(source, data)
    local player = Ox.GetPlayer(source)
    if not player then 
        return TriggerClientEvent('ox_lib:notify', source, {
            title = 'Invoice System',
            description = 'Player not found',
            type = 'error'
        })
    end

    local account = player.getAccount()
    if not account then 
        return TriggerClientEvent('ox_lib:notify', source, {
            title = 'Invoice System',
            description = 'No account found',
            type = 'error'
        })
    end

    local targetCharId = Ox.GetCharIdFromStateId(data.stateId)
    if not targetCharId then
        return TriggerClientEvent('ox_lib:notify', source, {
            title = 'Invoice System',
            description = 'Invalid State ID',
            type = 'error'
        })
    end

    local targetAccount = Ox.GetCharacterAccount(targetCharId)
    if not targetAccount then
        return TriggerClientEvent('ox_lib:notify', source, {
            title = 'Invoice System',
            description = 'Target account not found',
            type = 'error'
        })
    end

    local result = account.createInvoice({
        actorId = player.charId,
        toAccount = targetAccount.accountId,
        amount = data.amount,
        message = data.message,
        dueDate = os.date('%Y-%m-%d', os.time() + 7*24*60*60) -- 7 days
    })

    if result.success then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Invoice System',
            description = 'Invoice created successfully',
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Invoice System',
            description = 'Failed to create invoice: ' .. (result.message or 'unknown error'),
            type = 'error'
        })
    end

    return result.success
end)
RegisterCommand('invoice', function()
    local input = lib.inputDialog('Create Invoice', {
        {
            type = 'input',
            label = 'State ID',
            placeholder = 'ABC123',
            required = true
        },
        {
            type = 'number',
            label = 'Amount',
            icon = 'dollar-sign',
            required = true,
            min = 1
        },
        {
            type = 'input',
            label = 'Message',
            placeholder = 'Reason for invoice...',
            required = true
        }
    })

    if not input then return end

    lib.callback.await('ox_invoice:create', false, {
        stateId = input[1],
        amount = input[2],
        message = input[3]
    })
end)
module.exports = async (srv) => {

    /*
     * Handle the data like a boss.
     */
    srv.on('CREATE', 'Data', async (req) => {
        console.log('on CREATE')

        console.log('Received the following data:')
        console.log(req.data)

        /*
         * Terminate the request explicitly to elide default CRUD handler,
         * which attempts to write to the database.
         * 
         * The reply *must* return the incoming data payload as per OData
         * specification.
         */
        req.reply({data: req.data.data})
    }) 
}
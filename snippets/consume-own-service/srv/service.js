module.exports = async (srv) => {

   const { Foo } = cds.entities
   const { TrivialService } = cds.services

   srv.on('foo', async (req) => {
      // WIP:
      // https://answers.sap.com/questions/13043768/how-to-call-my-own-function-service.html
      let srv = await cds.connect.to('TrivialService')
      let query = SELECT.from('bar')
      await srv.run(query)

      return 0
   })

   srv.on('bar', async (req) => {
      console.log('huehue')

      return 0
   })

}
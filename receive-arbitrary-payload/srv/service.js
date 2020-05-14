module.exports = async (srv) => {

   srv.before('CREATE', 'Json', async (req) => {
       console.log('before CREATE')
   })
   srv.on('CREATE', 'Json', async (req) => {
       console.log('on CREATE')
       req.reply('OK')
   }) 
   srv.after('CREATE', 'Json', async (req) => {
       console.log('after CREATE')
   })

   
   srv.on('READ', 'Json', async (req) => {
       console.log('on READ')
       req.reply('Now that"s great')
   }) 
   
   srv.on('UPDATE', 'Json', async (req) => {
       console.log('on UPDATE')
       req.reply('Now that"s great')
   }) 
   srv.on('DELETE', 'Json', async (req) => {
       console.log('on DELETE')
       req.reply('Now that"s great')
   }) 
}
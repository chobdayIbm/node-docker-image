const app = require('./server')
const supertest = require('supertest')
const request = supertest(app)

describe('Test Endpoints', () => {
    it('should set up the test infrastructure', () => {
        expect(true).toBe(true)
    })

    it('should display the index page', async done => {
        const res = await request.get('/')
        expect(res.status).toBe(200)
        done()
    })
})

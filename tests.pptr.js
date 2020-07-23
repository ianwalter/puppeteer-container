import { test } from '@ianwalter/bff-puppeteer'

test('click handler', t => {
  let testValue = 'foo'
  const a = document.createElement('a')
  a.onclick = () => (testValue = 'bar')
  a.click()
  t.expect(testValue).toBe('bar')
})

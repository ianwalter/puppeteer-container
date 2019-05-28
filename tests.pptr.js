import { test } from '@ianwalter/bff'

test('click handler', ({ expect }) => {
  let testValue = 'foo'
  const a = document.createElement('a')
  a.onclick = () => (testValue = 'bar')
  a.click()
  expect(testValue).toBe('bar')
})

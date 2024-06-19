export function rowsTemplate(picCount: number): string {
  if (picCount > 6) {
    return '1fr 1fr 1fr'
  } else if (picCount > 3) {
    return '1fr 1fr'
  } else {
    return '1fr'
  }
}

export function columnsTemplate(picCount: number): string {
  if (picCount ===4){
    return '1fr 1fr'
  }else if(picCount > 1) {
    return '1fr 1fr 1fr'
  } else {
    return '1fr'
  }
}

export function pictureWallHeight(picCount: number): number {
  let baseHeight: number = 90
  let height = 0
  if (picCount > 6) {
    height = baseHeight * 3 + 15
  } else if (picCount > 3) {
    height = baseHeight * 2 + 10
  } else if (picCount > 1) {
    height = baseHeight
  } else {
    height = 220
  }
  return height
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요트 다이스 게임</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
  font-family: 'Roboto', sans-serif;
  background: #0f0c29;  
  background: linear-gradient(to right, #24243e, #302b63, #0f0c29);
  color: white;
  overflow: hidden;
}

.game {
  position: relative;
  width: 1000px;
  height: 750px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  border: none;
  border-radius: 20px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5);
  background: rgba(20, 20, 40, 0.7);
  overflow: hidden;
  padding: 20px;
}

.game::before {
  content: '';
  position: absolute;
  top: -50%;
  left: -50%;
  width: 200%;
  height: 200%;
  background: conic-gradient(
    from 0deg,
    transparent,
    rgba(100, 220, 255, 0.1),
    transparent 40%
  );
  animation: rotate 20s linear infinite;
  z-index: -1;
}

@keyframes rotate {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.title {
  position: relative;
  font-size: 42px;
  font-weight: bold;
  color: #fff;
  text-shadow: 0 0 20px rgba(100, 220, 255, 0.8);
  text-transform: uppercase;
  letter-spacing: 5px;
  margin-bottom: 40px;
  animation: pulse 2s ease-in-out infinite alternate;
}

@keyframes pulse {
  from {
    opacity: 0.8;
    text-shadow: 0 0 20px rgba(100, 220, 255, 0.8);
  }
  to {
    opacity: 1;
    text-shadow: 0 0 30px rgba(100, 220, 255, 1), 0 0 40px rgba(100, 220, 255, 0.6);
  }
}

.game-content {
  display: flex;
  width: 100%;
  height: 100%;
  justify-content: space-between;
}

.dice-section {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 60%;
  height: 100%;
}

.dice-container {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 400px;
  height: 400px;
  position: relative;
  margin-bottom: 30px;
}

.container {
  position: absolute;
  width: 80px;
  height: 80px;
  transition: all 0.5s ease;
}

.container:nth-child(1) {
  transform: translate(0, -140px);
}

.container:nth-child(2) {
  transform: translate(133px, -43px);
}

.container:nth-child(3) {
  transform: translate(82px, 112px);
}

.container:nth-child(4) {
  transform: translate(-82px, 112px);
}

.container:nth-child(5) {
  transform: translate(-133px, -43px);
}

.dice {
  position: relative;
  width: 80px;
  height: 80px;
  transform-style: preserve-3d;
  transition: transform 1.2s cubic-bezier(0.4, 2.7, 0.3, 1);
  cursor: pointer;
}

.dice:hover {
  /* transform 효과 제거 */
}

.side {
  position: absolute;
  background: linear-gradient(145deg, #2a2a4a, #1a1a2a);
  border-radius: 12px;
  width: 80px;
  height: 80px;
  border: 2px solid rgba(100, 220, 255, 0.2);
  box-shadow: inset 0 0 15px rgba(100, 220, 255, 0.1);
  transition: all 0.3s ease;
}

.selected .side {
  border: 2px solid rgba(100, 220, 255, 0.8);
  box-shadow: 0 0 15px rgba(100, 220, 255, 0.5), 
              inset 0 0 10px rgba(100, 220, 255, 0.3);
}

.dot {
  position: absolute;
  width: 15px;
  height: 15px;
  margin: -7.5px;
  border-radius: 50%;
  background: linear-gradient(145deg, #64dcff, #4a80ff);
  box-shadow: 0 0 10px rgba(100, 220, 255, 0.8);
}

.side:nth-child(1) { transform: translateZ(40px); }
.side:nth-child(2) { transform: rotateX(-90deg) translateZ(40px); }
.side:nth-child(3) { transform: rotateY(90deg) translateZ(40px); }
.side:nth-child(4) { transform: rotateY(-90deg) translateZ(40px); }
.side:nth-child(5) { transform: rotateX(90deg) translateZ(40px); }
.side:nth-child(6) { transform: rotateX(180deg) translateZ(40px); }

.roll-info {
  margin-top: 20px;
  text-align: center;
  font-size: 18px;
  color: rgba(255, 255, 255, 0.8);
  text-shadow: 0 0 5px rgba(100, 220, 255, 0.4);
}

button {
  padding: 12px 30px;
  color: #fff;
  background: linear-gradient(45deg, #4a80ff, #64dcff);
  border: none;
  font-size: 16px;
  font-weight: bold;
  letter-spacing: 1px;
  border-radius: 25px;
  box-shadow: 0 0 15px rgba(100, 220, 255, 0.4);
  transition: all 0.3s ease;
  cursor: pointer;
  margin: 10px;
}

button:hover {
  transform: translateY(-2px);
  box-shadow: 0 0 20px rgba(100, 220, 255, 0.7);
}

button:active {
  transform: translateY(1px);
  box-shadow: 0 0 10px rgba(100, 220, 255, 0.4);
}

button:disabled {
  background: linear-gradient(45deg, #41434e, #2c2e3e);
  cursor: not-allowed;
  box-shadow: none;
  transform: none;
}

.score-section {
  width: 40%;
  padding: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.scorecard {
  background: rgba(42, 42, 74, 0.7);
  border-radius: 15px;
  border: 1px solid rgba(100, 220, 255, 0.2);
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
  width: 100%;
  max-height: 550px;
  overflow-y: auto;
  transition: all 0.3s ease;
}

.scorecard::-webkit-scrollbar {
  width: 8px;
}

.scorecard::-webkit-scrollbar-track {
  background: rgba(42, 42, 74, 0.3);
  border-radius: 10px;
}

.scorecard::-webkit-scrollbar-thumb {
  background: rgba(100, 220, 255, 0.3);
  border-radius: 10px;
}

.scorecard::-webkit-scrollbar-thumb:hover {
  background: rgba(100, 220, 255, 0.5);
}

.scorecard table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
}

.scorecard th {
  background: linear-gradient(45deg, #41434e, #2c2e3e);
  color: #64dcff;
  padding: 15px;
  text-align: center;
  border-bottom: 1px solid rgba(100, 220, 255, 0.2);
}

.scorecard td {
  padding: 12px 15px;
  border-bottom: 1px solid rgba(100, 220, 255, 0.1);
  transition: all 0.3s ease;
  color: rgba(255, 255, 255, 0.8);
}

.scorecard tr:hover td {
  background: rgba(100, 220, 255, 0.05);
}

.scorecard .score {
  text-align: center;
  color: #64dcff;
  font-weight: bold;
}

.scorecard .action {
  text-align: center;
}

.scorecard .action button {
  padding: 5px 10px;
  font-size: 12px;
}

.scorecard .section-header {
  background: linear-gradient(45deg, #4a80ff, #2c2e3e);
  color: white;
  font-weight: bold;
  text-align: center;
}

.scorecard .subtotal, .scorecard .total {
  background: rgba(74, 128, 255, 0.1);
  font-weight: bold;
}

.scorecard .total {
  background: rgba(74, 128, 255, 0.2);
}

.tooltip-container {
  position: relative;
  display: inline-block;
  cursor: help;
}

.tooltip-text {
  visibility: hidden;
  width: 250px;
  background: rgba(20, 20, 40, 0.95);
  color: #fff;
  text-align: left;
  border-radius: 8px;
  padding: 12px 15px;
  position: absolute;
  z-index: 1000;
  left: 0;
  top: 120%;
  margin-left: 10px;
  opacity: 0;
  transition: all 0.3s ease;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.3),
              0 0 1px 1px rgba(100, 220, 255, 0.2);
  pointer-events: none;
  font-size: 14px;
  line-height: 1.4;
}

.tooltip-container:hover .tooltip-text {
  visibility: visible;
  opacity: 1;
}

.game-info {
  margin-top: 20px;
  text-align: center;
  font-size: 16px;
  color: rgba(255, 255, 255, 0.8);
}

.decorative-chip {
  position: absolute;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  box-shadow: 0 0 15px currentColor;
  animation: float 4s ease-in-out infinite;
}

@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-15px); }
}

.chip-red {
  background: linear-gradient(145deg, #ff5252, #d32f2f);
  color: #ff5252;
  left: 100px;
  bottom: 50px;
  animation-delay: 0s;
}

.chip-blue {
  background: linear-gradient(145deg, #64dcff, #4a80ff);
  color: #4a80ff;
  right: 100px;
  bottom: 50px;
  animation-delay: 2s;
}

.chip-purple {
  background: linear-gradient(145deg, #b388ff, #7c4dff);
  color: #7c4dff;
  left: 200px;
  bottom: 80px;
  animation-delay: 1s;
  width: 20px;
  height: 20px;
}

.chip-teal {
  background: linear-gradient(145deg, #64ffda, #00b8d4);
  color: #00b8d4;
  right: 200px;
  bottom: 80px;
  animation-delay: 3s;
  width: 20px;
  height: 20px;
}

.game-over {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(20, 20, 40, 0.9);
  backdrop-filter: blur(5px);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  z-index: 999;
  display: none;
}

.game-over h2 {
  font-size: 50px;
  color: #64dcff;
  text-shadow: 0 0 20px rgba(100, 220, 255, 0.8);
  margin-bottom: 20px;
  animation: pulse 2s ease-in-out infinite alternate;
}

.game-over p {
  font-size: 24px;
  color: white;
  margin-bottom: 40px;
}

.game-over button {
  padding: 15px 40px;
  font-size: 20px;
}

.show-1 { transform: rotateX(0deg) rotateY(0deg); }
.show-2 { transform: rotateX(90deg) rotateY(0deg); }
.show-3 { transform: rotateY(-90deg) rotateY(0deg); }
.show-4 { transform: rotateY(90deg) rotateY(0deg); }
.show-5 { transform: rotateX(-90deg) rotateY(0deg); }
.show-6 { transform: rotateX(180deg) rotateY(0deg); }

/* 주사위 점 위치 */
.one-1 { top: 50%; left: 50%; }

.two-1 { top: 25%; left: 25%; }
.two-2 { top: 75%; left: 75%; }

.three-1 { top: 25%; left: 25%; }
.three-2 { top: 50%; left: 50%; }
.three-3 { top: 75%; left: 75%; }

.four-1 { top: 25%; left: 25%; }
.four-2 { top: 25%; left: 75%; }
.four-3 { top: 75%; left: 25%; }
.four-4 { top: 75%; left: 75%; }

.five-1 { top: 25%; left: 25%; }
.five-2 { top: 25%; left: 75%; }
.five-3 { top: 50%; left: 50%; }
.five-4 { top: 75%; left: 25%; }
.five-5 { top: 75%; left: 75%; }

.six-1 { top: 25%; left: 25%; }
.six-2 { top: 25%; left: 50%; }
.six-3 { top: 25%; left: 75%; }
.six-4 { top: 75%; left: 25%; }
.six-5 { top: 75%; left: 50%; }
.six-6 { top: 75%; left: 75%; }
</style>
</head>
<body>
<div class="game">
<div class="title">요트 다이스</div>

<div class="game-content">
<div class="dice-section">
  <div class="dice-container">
    <div class="container">
      <div id='dice1' class="dice">
        <div id="dice-one-side-one" class='side one'>
          <div class="dot one-1"></div>
        </div>
        <div id="dice-one-side-two" class='side two'>
          <div class="dot two-1"></div>
          <div class="dot two-2"></div>
        </div>
        <div id="dice-one-side-three" class='side three'>
          <div class="dot three-1"></div>
          <div class="dot three-2"></div>
          <div class="dot three-3"></div>
        </div>
        <div id="dice-one-side-four" class='side four'>
          <div class="dot four-1"></div>
          <div class="dot four-2"></div>
          <div class="dot four-3"></div>
          <div class="dot four-4"></div>
        </div>
        <div id="dice-one-side-five" class='side five'>
          <div class="dot five-1"></div>
          <div class="dot five-2"></div>
          <div class="dot five-3"></div>
          <div class="dot five-4"></div>
          <div class="dot five-5"></div>
        </div>
        <div id="dice-one-side-six" class='side six'>
          <div class="dot six-1"></div>
          <div class="dot six-2"></div>
          <div class="dot six-3"></div>
          <div class="dot six-4"></div>
          <div class="dot six-5"></div>
          <div class="dot six-6"></div>
        </div>
      </div>
    </div>
    <div class="container">
      <div id='dice2' class="dice">
        <div id="dice-two-side-one" class='side one'>
          <div class="dot one-1"></div>
        </div>
        <div id="dice-two-side-two" class='side two'>
          <div class="dot two-1"></div>
          <div class="dot two-2"></div>
        </div>
        <div id="dice-two-side-three" class='side three'>
          <div class="dot three-1"></div>
          <div class="dot three-2"></div>
          <div class="dot three-3"></div>
        </div>
        <div id="dice-two-side-four" class='side four'>
          <div class="dot four-1"></div>
          <div class="dot four-2"></div>
          <div class="dot four-3"></div>
          <div class="dot four-4"></div>
        </div>
        <div id="dice-two-side-five" class='side five'>
          <div class="dot five-1"></div>
          <div class="dot five-2"></div>
          <div class="dot five-3"></div>
          <div class="dot five-4"></div>
          <div class="dot five-5"></div>
        </div>
        <div id="dice-two-side-six" class='side six'>
          <div class="dot six-1"></div>
          <div class="dot six-2"></div>
          <div class="dot six-3"></div>
          <div class="dot six-4"></div>
          <div class="dot six-5"></div>
          <div class="dot six-6"></div>
        </div>
      </div>
    </div>
    <div class="container">
      <div id='dice3' class="dice">
        <div id="dice-three-side-one" class='side one'>
          <div class="dot one-1"></div>
        </div>
        <div id="dice-three-side-two" class='side two'>
          <div class="dot two-1"></div>
          <div class="dot two-2"></div>
        </div>
        <div id="dice-three-side-three" class='side three'>
          <div class="dot three-1"></div>
          <div class="dot three-2"></div>
          <div class="dot three-3"></div>
        </div>
        <div id="dice-three-side-four" class='side four'>
          <div class="dot four-1"></div>
          <div class="dot four-2"></div>
          <div class="dot four-3"></div>
          <div class="dot four-4"></div>
        </div>
        <div id="dice-three-side-five" class='side five'>
          <div class="dot five-1"></div>
          <div class="dot five-2"></div>
          <div class="dot five-3"></div>
          <div class="dot five-4"></div>
          <div class="dot five-5"></div>
        </div>
        <div id="dice-three-side-six" class='side six'>
          <div class="dot six-1"></div>
          <div class="dot six-2"></div>
          <div class="dot six-3"></div>
          <div class="dot six-4"></div>
          <div class="dot six-5"></div>
          <div class="dot six-6"></div>
        </div>
      </div>
    </div>
    <div class="container">
      <div id='dice4' class="dice">
        <div id="dice-four-side-one" class='side one'>
          <div class="dot one-1"></div>
        </div>
        <div id="dice-four-side-two" class='side two'>
          <div class="dot two-1"></div>
          <div class="dot two-2"></div>
        </div>
        <div id="dice-four-side-three" class='side three'>
          <div class="dot three-1"></div>
          <div class="dot three-2"></div>
          <div class="dot three-3"></div>
        </div>
        <div id="dice-four-side-four" class='side four'>
          <div class="dot four-1"></div>
          <div class="dot four-2"></div>
          <div class="dot four-3"></div>
          <div class="dot four-4"></div>
        </div>
        <div id="dice-four-side-five" class='side five'>
          <div class="dot five-1"></div>
          <div class="dot five-2"></div>
          <div class="dot five-3"></div>
          <div class="dot five-4"></div>
          <div class="dot five-5"></div>
        </div>
        <div id="dice-four-side-six" class='side six'>
          <div class="dot six-1"></div>
          <div class="dot six-2"></div>
          <div class="dot six-3"></div>
          <div class="dot six-4"></div>
          <div class="dot six-5"></div>
          <div class="dot six-6"></div>
        </div>
      </div>
    </div>
    <div class="container">
      <div id='dice5' class="dice">
        <div id="dice-five-side-one" class='side one'>
          <div class="dot one-1"></div>
        </div>
        <div id="dice-five-side-two" class='side two'>
          <div class="dot two-1"></div>
          <div class="dot two-2"></div>
        </div>
        <div id="dice-five-side-three" class='side three'>
          <div class="dot three-1"></div>
          <div class="dot three-2"></div>
          <div class="dot three-3"></div>
        </div>
        <div id="dice-five-side-four" class='side four'>
          <div class="dot four-1"></div>
          <div class="dot four-2"></div>
          <div class="dot four-3"></div>
          <div class="dot four-4"></div>
        </div>
        <div id="dice-five-side-five" class='side five'>
          <div class="dot five-1"></div>
          <div class="dot five-2"></div>
          <div class="dot five-3"></div>
          <div class="dot five-4"></div>
          <div class="dot five-5"></div>
        </div>
        <div id="dice-five-side-six" class='side six'>
          <div class="dot six-1"></div>
          <div class="dot six-2"></div>
          <div class="dot six-3"></div>
          <div class="dot six-4"></div>
          <div class="dot six-5"></div>
          <div class="dot six-6"></div>
        </div>
      </div>
    </div>
  </div>
  
  <div class="roll-info">주사위를 클릭하여 유지할 주사위를 선택하세요.</div>
  <div class="roll-info">남은 굴림 횟수: <span id="rolls-left">3</span></div>
  
  <div class="action-buttons">
    <div id='roll' class='roll-button'><button>주사위 굴리기</button></div>
  </div>
</div>

<div class="score-section">
  <div class="scorecard">
    <table>
      <thead>
        <tr>
          <th>카테고리</th>
          <th>점수</th>
          <th>선택</th>
        </tr>
      </thead>
      <tbody>
        <tr class="section-header">
          <td colspan="3">Upper Section</td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Aces (1)
              <span class="tooltip-text">1이 나온 주사위의 합계입니다. 예: 1,1,2,3,4면 2점</span>
            </div>
          </td>
          <td class="score" id="score-aces">-</td>
          <td class="action"><button id="select-aces" disabled>선택</button></td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Deuces (2)
              <span class="tooltip-text">2가 나온 주사위의 합계입니다. 예: 2,2,3,4,5면 4점</span>
            </div>
          </td>
          <td class="score" id="score-deuces">-</td>
          <td class="action"><button id="select-deuces" disabled>선택</button></td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Threes (3)
              <span class="tooltip-text">3이 나온 주사위의 합계입니다. 예: 3,3,3,4,5면 9점</span>
            </div>
          </td>
          <td class="score" id="score-threes">-</td>
          <td class="action"><button id="select-threes" disabled>선택</button></td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Fours (4)
              <span class="tooltip-text">4가 나온 주사위의 합계입니다. 예: 4,4,4,4,5면 16점</span>
            </div>
          </td>
          <td class="score" id="score-fours">-</td>
          <td class="action"><button id="select-fours" disabled>선택</button></td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Fives (5)
              <span class="tooltip-text">5가 나온 주사위의 합계입니다. 예: 5,5,5,5,5면 25점</span>
            </div>
          </td>
          <td class="score" id="score-fives">-</td>
          <td class="action"><button id="select-fives" disabled>선택</button></td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Sixes (6)
              <span class="tooltip-text">6이 나온 주사위의 합계입니다. 예: 6,6,6,6,6면 30점</span>
            </div>
          </td>
          <td class="score" id="score-sixes">-</td>
          <td class="action"><button id="select-sixes" disabled>선택</button></td>
        </tr>
        <tr class="subtotal">
          <td class="category">Upper Section 합계</td>
          <td class="score" id="upper-score">0</td>
          <td></td>
        </tr>
        <tr class="subtotal">
          <td class="category">보너스 (Upper 63↑)</td>
          <td class="score" id="bonus-score">0</td>
          <td></td>
        </tr>
        <tr class="section-header">
          <td colspan="3">Lower Section</td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Choice (모든 주사위 합)
              <span class="tooltip-text">모든 주사위의 합계입니다. 어떤 조합이든 가능합니다.</span>
            </div>
          </td>
          <td class="score" id="score-choice">-</td>
          <td class="action"><button id="select-choice" disabled>선택</button></td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              4 of a Kind (같은 주사위 4개)
              <span class="tooltip-text">같은 숫자가 4개 이상일 때 모든 주사위의 합계입니다. 예: 4,4,4,4,2면 18점</span>
            </div>
          </td>
          <td class="score" id="score-four-kind">-</td>
          <td class="action"><button id="select-four-kind" disabled>선택</button></td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Full House (같은 수 3개+2개)
              <span class="tooltip-text">같은 숫자 3개와 다른 같은 숫자 2개가 있을 때 25점입니다. 예: 3,3,3,2,2</span>
            </div>
          </td>
          <td class="score" id="score-full-house">-</td>
          <td class="action"><button id="select-full-house" disabled>선택</button></td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Small Straight (연속 4개)
              <span class="tooltip-text">4개의 연속된 숫자가 있으면 30점입니다. 예: 1,2,3,4,6 또는 2,3,4,5,5</span>
            </div>
          </td>
          <td class="score" id="score-small-straight">-</td>
          <td class="action"><button id="select-small-straight" disabled>선택</button></td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Large Straight (연속 5개)
              <span class="tooltip-text">5개의 연속된 숫자가 있으면 40점입니다. 예: 1,2,3,4,5 또는 2,3,4,5,6</span>
            </div>
          </td>
          <td class="score" id="score-large-straight">-</td>
          <td class="action"><button id="select-large-straight" disabled>선택</button></td>
        </tr>
        <tr>
          <td class="category">
            <div class="tooltip-container">
              Yacht (같은 주사위 5개)
              <span class="tooltip-text">5개의 주사위가 모두 같은 숫자이면 50점입니다. 예: 4,4,4,4,4</span>
            </div>
          </td>
          <td class="score" id="score-yacht">-</td>
          <td class="action"><button id="select-yacht" disabled>선택</button></td>
        </tr>
        <tr class="total">
          <td class="category">총점</td>
          <td class="score" id="total-score">0</td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </div>
  
  <div class="game-info">
    <p>턴: <span id="current-turn">1</span>/12</p>
  </div>
</div>
</div>

<div class="decorative-chip chip-red"></div>
<div class="decorative-chip chip-blue"></div>
<div class="decorative-chip chip-purple"></div>
<div class="decorative-chip chip-teal"></div>

<div class="game-over">
<h2>게임 종료!</h2>
<p>최종 점수: <span id="final-score">0</span>점</p>
<button id="new-game">새 게임 시작</button>
</div>
</div>
<script>
// 요트다이스 게임 변수
var elDiceOne = document.getElementById("dice1");
var elDiceTwo = document.getElementById("dice2");
var elDiceThree = document.getElementById("dice3");
var elDiceFour = document.getElementById("dice4");
var elDiceFive = document.getElementById("dice5");
var elComeOut = document.getElementById("roll");
var elRollsLeft = document.getElementById("rolls-left");
var elCurrentTurn = document.getElementById("current-turn");

// 게임 상태 변수
var remainingRolls = 3; // 턴당 최대 3번 굴릴 수 있음
var currentTurn = 1; // 총 12턴
var diceValues = [1, 3, 4, 3, 5]; // 현재 주사위 값 수정
var scoreCategories = {
'aces': null,
'deuces': null,
'threes': null,
'fours': null,
'fives': null,
'sixes': null,
'choice': null,
'four-kind': null,
'full-house': null,
'small-straight': null,
'large-straight': null,
'yacht': null
};

// 주사위를 클릭하면 선택/선택해제할 수 있게 합니다
var diceElements = document.querySelectorAll('.dice');
diceElements.forEach(function(dice) {
dice.addEventListener('click', function() {
if (remainingRolls < 3) { // 첫 번째 굴림 이후에만 주사위 선택 가능
  this.classList.toggle('selected');
}
});
});

// 주사위 굴리기 버튼 이벤트
elComeOut.onclick = function () {
if (remainingRolls > 0) {
rollDice();
remainingRolls--;
elRollsLeft.textContent = remainingRolls;

// 버튼 텍스트 업데이트
updateRollButtonText();

// 모든 카테고리 버튼 활성화
updatePossibleScores();

// 주사위 굴림 횟수가 0이 되면 버튼 비활성화
if (remainingRolls === 0) {
  elComeOut.querySelector('button').disabled = true;
}
}
};

// 모든 카테고리 선택 버튼에 이벤트 리스너 추가
document.querySelectorAll('.action button').forEach(function(button) {
button.addEventListener('click', function() {
var categoryId = this.id.replace('select-', '');
selectCategory(categoryId);
});
});

// 새 게임 버튼
document.getElementById('new-game').addEventListener('click', function() {
startNewGame();
});

// 주사위 굴리기 함수
function rollDice() {
var diceElements = [elDiceOne, elDiceTwo, elDiceThree, elDiceFour, elDiceFive];

diceElements.forEach((diceElement, index) => {
if (!diceElement.classList.contains('selected')) {
  var newValue = Math.floor(Math.random() * 6 + 1);
  
  for (var i = 1; i <= 6; i++) {
    diceElement.classList.remove("show-" + i);
  }
  
  diceElement.classList.add("show-" + newValue);
  diceValues[index] = newValue;
} else {
  diceValues[index] = getDiceValue(diceElement);
}
});
}

// 주사위 값 가져오기 함수
function getDiceValue(diceElement) {
for (var i = 1; i <= 6; i++) {
if (diceElement.classList.contains("show-" + i)) {
  return i;
}
}
return 1; // 기본값
}

// 가능한 점수 업데이트 및 버튼 활성화
function updatePossibleScores() {
// Upper section 점수 계산
updateNumberScore('aces', 1);
updateNumberScore('deuces', 2);
updateNumberScore('threes', 3);
updateNumberScore('fours', 4);
updateNumberScore('fives', 5);
updateNumberScore('sixes', 6);

// Choice 계산 수정
var diceSum = 0;
for (var i = 0; i < diceValues.length; i++) {
if (diceValues[i] >= 1 && diceValues[i] <= 6) {
  diceSum += diceValues[i];
} else {
  console.error("잘못된 주사위 값이 Choice 계산에 포함됨:", diceValues[i]);
}
}
console.log("주사위 개별 값:", diceValues.join(", "));
console.log("Choice 점수 계산:", diceSum);
updateScore('choice', diceSum);

// Four of a Kind
var fourKindScore = calculateFourOfAKind();
updateScore('four-kind', fourKindScore);

// Full House
var fullHouseScore = calculateFullHouse();
updateScore('full-house', fullHouseScore);

// Small Straight
var smallStraightScore = calculateSmallStraight();
updateScore('small-straight', smallStraightScore);

// Large Straight
var largeStraightScore = calculateLargeStraight();
updateScore('large-straight', largeStraightScore);

// Yacht
var yachtScore = calculateYacht();
updateScore('yacht', yachtScore);
}

// 특정 숫자의 합 계산 (Upper section)
function updateNumberScore(category, number) {
var score = diceValues.filter(value => value === number).reduce((a, b) => a + b, 0);
updateScore(category, score);
}

// 점수 업데이트 및 버튼 상태 설정
function updateScore(category, score) {
var scoreElement = document.getElementById('score-' + category);
var buttonElement = document.getElementById('select-' + category);

// 이미 선택된 카테고리면 업데이트하지 않음
if (scoreCategories[category] !== null) {
return;
}

// 점수 표시 및 버튼 활성화
scoreElement.textContent = score;
buttonElement.disabled = remainingRolls === 3; // 첫 굴림 전에는 비활성화
}

// Four of a Kind 점수 계산
function calculateFourOfAKind() {
var counts = countDiceValues();
var total = diceValues.reduce((a, b) => a + b, 0);

for (var number in counts) {
if (counts[number] >= 4) {
  return total;
}
}

return 0;
}

// Full House 점수 계산
function calculateFullHouse() {
var counts = countDiceValues();
var hasThree = false;
var hasTwo = false;

for (var number in counts) {
if (counts[number] === 3) {
  hasThree = true;
} else if (counts[number] === 2) {
  hasTwo = true;
} else if (counts[number] >= 5) {
  return 25;
} else if (counts[number] === 4) {
  hasThree = true;
}
}

if (hasThree && hasTwo) {
return 25;
}

return 0;
}

// Small Straight 점수 계산 (연속된 4개)
function calculateSmallStraight() {
var uniqueSorted = [...new Set(diceValues)].sort((a, b) => a - b);

// 중복 제거 후 길이가 4 이상이고 연속된 숫자인지 확인
if (uniqueSorted.length >= 4) {
for (var i = 0; i <= uniqueSorted.length - 4; i++) {
  var sequence = uniqueSorted.slice(i, i + 4);
  if (isConsecutive(sequence)) {
    return 30;
  }
}
}

return 0;
}

// Large Straight 점수 계산 (연속된 5개)
function calculateLargeStraight() {
var uniqueSorted = [...new Set(diceValues)].sort((a, b) => a - b);

// 중복 제거 후 길이가 5이고 연속된 숫자인지 확인
if (uniqueSorted.length === 5 && isConsecutive(uniqueSorted)) {
return 40;
}

return 0;
}

// Yacht 점수 계산 (같은 숫자 5개)
function calculateYacht() {
var counts = countDiceValues();

for (var number in counts) {
if (counts[number] === 5) {
  return 50;
}
}

return 0;
}

// 주사위 값 카운트
function countDiceValues() {
var counts = {};

diceValues.forEach(function(value) {
counts[value] = (counts[value] || 0) + 1;
});

return counts;
}

// 배열이 연속된 숫자인지 확인
function isConsecutive(arr) {
for (var i = 1; i < arr.length; i++) {
if (arr[i] !== arr[i-1] + 1) {
  return false;
}
}
return true;
}

// 카테고리 선택
function selectCategory(category) {
// 점수 기록
var scoreElement = document.getElementById('score-' + category);
var score = parseInt(scoreElement.textContent);
scoreCategories[category] = score;

// 버튼 비활성화
document.getElementById('select-' + category).disabled = true;

// 점수 합계 업데이트
updateTotalScores();

// 턴 종료 및 다음 턴 시작
startNextTurn();
}

// 점수 합계 업데이트
function updateTotalScores() {
// Upper Section 합계
var upperScore = 0;
['aces', 'deuces', 'threes', 'fours', 'fives', 'sixes'].forEach(function(category) {
if (scoreCategories[category] !== null) {
  upperScore += scoreCategories[category];
}
});

document.getElementById('upper-score').textContent = upperScore;

// 보너스 점수 (Upper Section 합계가 63점 이상이면 35점)
var bonusScore = upperScore >= 63 ? 35 : 0;
document.getElementById('bonus-score').textContent = bonusScore;

// 총점
var totalScore = upperScore + bonusScore;

// Lower Section 점수 추가
['choice', 'four-kind', 'full-house', 'small-straight', 'large-straight', 'yacht'].forEach(function(category) {
if (scoreCategories[category] !== null) {
  totalScore += scoreCategories[category];
}
});

document.getElementById('total-score').textContent = totalScore;
}

// 다음 턴 시작
function startNextTurn() {
currentTurn++;
elCurrentTurn.textContent = currentTurn;

// 모든 주사위 선택 해제
diceElements.forEach(function(dice) {
dice.classList.remove('selected');
});

// 주사위 굴림 횟수 초기화
remainingRolls = 3;
elRollsLeft.textContent = remainingRolls;

// 주사위 굴리기 버튼 활성화 및 텍스트 업데이트
elComeOut.querySelector('button').disabled = false;
updateRollButtonText();

// 가능한 점수 업데이트
updatePossibleScores();

// 게임 종료 확인
if (currentTurn > 12 || isGameOver()) {
endGame();
}
}

// 게임 종료 여부 확인
function isGameOver() {
for (var category in scoreCategories) {
if (scoreCategories[category] === null) {
  return false;
}
}
return true;
}

// 게임 종료
function endGame() {
var finalScore = parseInt(document.getElementById('total-score').textContent);
document.getElementById('final-score').textContent = finalScore;
document.querySelector('.game-over').style.display = 'flex';
}

// 새 게임 시작
function startNewGame() {
// 게임 상태 초기화
currentTurn = 1;
elCurrentTurn.textContent = currentTurn;

remainingRolls = 3;
elRollsLeft.textContent = remainingRolls;

// 버튼 텍스트 초기화
updateRollButtonText();

// 모든 카테고리 초기화
for (var category in scoreCategories) {
scoreCategories[category] = null;
document.getElementById('score-' + category).textContent = '-';
document.getElementById('select-' + category).disabled = true;
}

// 점수 합계 초기화
document.getElementById('upper-score').textContent = '0';
document.getElementById('bonus-score').textContent = '0';
document.getElementById('total-score').textContent = '0';

// 주사위 값 초기화
diceValues = [1, 3, 4, 3, 5];

// 주사위 화면 초기화 및 값 설정
setInitialDiceValues();

// 주사위 선택 해제
diceElements.forEach(function(dice) {
dice.classList.remove('selected');
});

// 주사위 굴리기 버튼 활성화
elComeOut.querySelector('button').disabled = false;

// 게임 오버 화면 숨기기
document.querySelector('.game-over').style.display = 'none';
}

// 초기 주사위 값 설정
function setInitialDiceValues() {
var diceElements = [elDiceOne, elDiceTwo, elDiceThree, elDiceFour, elDiceFive];

diceElements.forEach((diceElement) => {
for (var i = 1; i <= 6; i++) {
  diceElement.classList.remove("show-" + i);
}
});

diceValues.forEach((value, index) => {
var diceElement = diceElements[index];
diceElement.classList.add("show-" + value);
});

updatePossibleScores();
}

// 게임 시작 시 초기화
window.addEventListener('DOMContentLoaded', function() {
diceValues = [1, 3, 4, 3, 5];
setInitialDiceValues();
});

// 게임 초기화
startNewGame();

// 버튼 텍스트 업데이트 함수
function updateRollButtonText() {
var rollButton = elComeOut.querySelector('button');
rollButton.textContent = remainingRolls === 3 ? '주사위 굴리기' : '다시 굴리기';
}
</script>
</body>
</html> 
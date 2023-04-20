echo "EHLO kubero.dev
MAIL FROM: test@kubero.dev
RCPT TO: kubero@tonne.to
DATA
Date: Thu, 20 Apr 2023 15:22:21 +0200
From: [TEST] <test@kubero.dev>
To: <kubero@tonne.to>
Subject: test Thu, 20 Apr 2023 15:22:21 +0200
Message-Id: <20230420152216.040766@localhorst.local>
X-Mailer: swaks v20201014.0 jetmore.org/john/code/swaks/

This is a test

.
QUIT" | nc localhost 8025
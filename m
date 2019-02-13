From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.4 15/16] leds: lp5523: fix a missing check of return value of lp55xx_read
Date: Tue, 12 Feb 2019 21:41:11 -0500
Message-ID: <20190213024112.22038-15-sashal@kernel.org>
References: <20190213024112.22038-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190213024112.22038-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Kangjie Lu <kjlu@umn.edu>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Sasha Levin <sashal@kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Kangjie Lu <kjlu@umn.edu>

[ Upstream commit 248b57015f35c94d4eae2fdd8c6febf5cd703900 ]

When lp55xx_read() fails, "status" is an uninitialized variable and thus
may contain random value; using it leads to undefined behaviors.

The fix inserts a check for the return value of lp55xx_read: if it
fails, returns with its error code.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/leds/leds-lp5523.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 1d0187f42941..d12370352ae3 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -318,7 +318,9 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 
 	/* Let the programs run for couple of ms and check the engine status */
 	usleep_range(3000, 6000);
-	lp55xx_read(chip, LP5523_REG_STATUS, &status);
+	ret = lp55xx_read(chip, LP5523_REG_STATUS, &status);
+	if (ret)
+		return ret;
 	status &= LP5523_ENG_STATUS_MASK;
 
 	if (status != LP5523_ENG_STATUS_MASK) {
-- 
2.19.1

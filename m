From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 0/2] led: is31fl32xx: minor improvements
Date: Mon, 18 Jul 2016 19:03:29 +0200
Message-ID: <cover.1468861410.git.hns@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, drivshin.allworx@gmail.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: linux-leds@vger.kernel.org

Changes V2:
* added tested&acked-by David Rivshin <drivshin@allworx.com> (received off-list)
* fixes: (received off-list)

2016-07-18 18:39:40: while developing the is31fl319x driver we found some minor issues relevant in the is31fl32xx driver.

H. Nikolaus Schaller (2):
  led: is31fl32xx: fix typo in id and match table names
  led: is31fl32xx: define complete i2c_device_id table

 drivers/leds/leds-is31fl32xx.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.7.3

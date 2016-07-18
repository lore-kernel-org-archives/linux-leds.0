From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/2] led: is31fl32xx: minor improvements
Date: Mon, 18 Jul 2016 18:39:33 +0200
Message-ID: <cover.1468859975.git.hns@goldelico.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:36720 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751528AbcGRQjv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 18 Jul 2016 12:39:51 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, drivshin.allworx@gmail.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>

while developing the is31fl319x driver we found some minor issues relevant in the is31fl32xx driver.

H. Nikolaus Schaller (2):
  led: is31fl32xx: fix typo in id and match table names
  led: is31fl32xx: define complete i2c_device_id table

 drivers/leds/leds-is31fl32xx.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.7.3

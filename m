Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586054;
	b=WmuPYdmb/2ZDni3iaJufK7oNeeU3fhcHcmkMEfJInS7HsYhyMCAGY89+XcByH18ux112
	 Eqe178cLyTXZ7pSGjoUPGziGkKSxh/VuABTHNpwKZ3qbm0UyUX/zEprBnrB3jtwNwPKT2
	 8xntx4wYAyC+Ok7l3+FIpd2OQPwlvZ/zjaEKcN3eDVnpOFUWdefZNKJVWEOnN9JYL+Hqi
	 aArhG94hUFRJbFWS3YjHdVHBJNGZlteKkHFQsptMVDLQQPT0EGm9f5knHNqp7jftJrV6I
	 PDlsOWujVAgWAwFLFy9p5V83CH6s8jHvyzgbQ/uoYFSjQ6js3scA/ensGvw0BaNaNHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586054;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oCMOn40NccaGOS4gmQxdzi3E/6HSzERzxev/qy2Vqw4=;
	b=Kkvbapb2vPBs/e8pql2MWjr+7nj0noudoFWyB63xpwrE2NkO4arFPHsFHvhOjZa6iNKI
	 Tc25ikz+8v8sUqsUdJsdYZ/fyoiYKROhiDC1AWUrKSCEg5E/PkDcP+7Qp37nCTsSxGCgF
	 mF79xtk+F4UowMZzTthR5AIHwC5aCelAWqKZGF3Opp1Y6NlSVoJiup7RRwvsKF3JfWJ+n
	 jfb4Ghodh1uHMuig8sHJyWVmKnpys+C3y6U4/JZmyYfLImWIN5EUsRvGzQLZuCfdaQF9p
	 WbkFhRmGeGrY/bNJt30xLoUKO73qJZNXLiyYjMtIn0s4mq0FxFVexPw59PWZkFchB+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpaBmBfC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B6B606A319;
	Wed, 21 Oct 2026 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpaBmBfC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383861F000C4;
	Wed, 21 Oct 2026 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792586053;
	bh=oCMOn40NccaGOS4gmQxdzi3E/6HSzERzxev/qy2Vqw4=;
	h=From:To:Cc:Subject:Date;
	b=SpaBmBfCdzG7Pe38iEJy5KQfbHAG0aX44GrBrFYDVDqhTv6mRzRjEstTQuXpqt8TX
	 fR9In0KHUocbJEyn4qhTemO2gLaG+3V2U9ZpAU/jAIvLNwWBL+1yaBylXTrIlRSQHn
	 3rx/7B2bi38sY/uDT1soaH0cL/CzIUDSmo60i5eEYLTeau7Sh5nWyCYOx4+lZMgLs8
	 wd1a3odQ/5urPHsHF1t5F5cA/jSwv9855eFLwaNS9rpf+EUziM/+rSn1XEFUGIOW9c
	 17F8iMFkXZaz+qBCcHkawosOlLH+g4/9649sY/HlzVgEY6Z2x1j/Jxdd5+c2XPG6n5
	 6EqpKlA/ePNVQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Ben Whitten <ben.whitten@gmail.com>,
	Bryan Wu <cooloney@gmail.com>,
	Christian Hitz <christian.hitz@bbv.ch>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Dan Murphy <dmurphy@ti.com>,
	David Rivshin <drivshin@allworx.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dmitry Antipov <dmantipov@yandex.ru>,
	Eddie James <eajames@linux.ibm.com>,
	Florian Fainelli <ffainelli@freebox.fr>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	John Lenz <lenz@cs.wisc.edu>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	linux-leds@vger.kernel.org,
	Luca Weiss <luca@lucaweiss.eu>,
	Luis Henriques <lhenriques@suse.com>,
	Nate Case <ncase@xes-inc.com>,
	Nikita Travkin <nikitos.tr@gmail.com>,
	Oliver Jowett <oliver@opencloud.com>,
	Pavel Machek <pavel@kernel.org>,
	Richard Purdie <rpurdie@openedhand.com>
Subject: [PATCH 00/21] leds: Assorted bug fixes across core, flash, trigger, and drivers
Date: Wed, 21 Oct 2026 12:32:09 +0000
Message-ID: <20261021123406.3163547-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These issues were reported by Sashiko.

This series addresses a collection of bugs across the LEDs subsystem,
including locking and concurrency fixes, device-tree node reference
leaks, out-of-bounds array accesses, divide-by-zero and current-limit
clamping issues, and devres lifecycle ordering fixes.

Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Ben Whitten <ben.whitten@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Christian Hitz <christian.hitz@bbv.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: David Rivshin <drivshin@allworx.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Eddie James <eajames@linux.ibm.com>
Cc: Florian Fainelli <ffainelli@freebox.fr>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: John Lenz <lenz@cs.wisc.edu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-leds@vger.kernel.org
Cc: Luca Weiss <luca@lucaweiss.eu>
Cc: Luis Henriques <lhenriques@suse.com>
Cc: Nate Case <ncase@xes-inc.com>
Cc: Nikita Travkin <nikitos.tr@gmail.com>
Cc: Oliver Jowett <oliver@opencloud.com>
Cc: Pavel Machek <pavel@kernel.org>
Cc: Richard Purdie <rpurdie@openedhand.com>

Lee Jones (21):
  leds: lm3532: Propagate error from devm_regulator_get()
  leds: lm3532: Use dev_err_probe() when lm3532_parse_node() fails
  leds: trigger: netdev: Hold RTNL lock across hw_control_get_device()
    in activate
  leds: aw2013: Guard LED array index in aw2013_probe_dt()
  leds: pca955x: Take a reference on the child firmware node
  leds: lp50xx: Guard sub-LED count in lp50xx_probe_dt()
  leds: trigger: netdev: Serialise work cancellation and state updates
  leds: sgm3140: Replace powerdown timer with delayed work
  leds: sgm3140: Cancel powerdown work via devres after LED
    unregistration
  leds: class: Initialise trigger_lock before exposing sysfs attributes
  leds: class: Unlock led_access before unregistering device on error
  leds: aat1290: Retain child device_node reference for device lifetime
  leds: aat1290: Prevent out-of-bounds read in
    aat1290_brightness_to_intensity()
  leds: flash: Avoid divide-by-zero in led_clamp_align()
  leds: lm3532: Validate LED string indices in lm3532_parse_node()
  leds: lm3532: Clamp full-scale current to minimum bound
  leds: aat1290: Avoid leaking devres pinctrl handles on strobe source
    changes
  leds: aw2013: Unlock chip mutex before registering LEDs
  leds: is31fl32xx: Clamp channel current limit in is31fl3293_reset()
  leds: flash: Terminate sysfs_groups array with NULL
  leds: lm3692x: Use devm_mutex_init() to avoid premature mutex
    destruction

 drivers/leds/flash/leds-aat1290.c     | 18 +++++++--
 drivers/leds/flash/leds-sgm3140.c     | 30 ++++++++------
 drivers/leds/led-class-flash.c        |  7 ++++
 drivers/leds/led-class.c              |  9 +++--
 drivers/leds/leds-aw2013.c            | 57 ++++++++++++++++-----------
 drivers/leds/leds-is31fl32xx.c        |  3 +-
 drivers/leds/leds-lm3532.c            | 33 +++++++++-------
 drivers/leds/leds-lm3692x.c           |  6 ++-
 drivers/leds/leds-lp50xx.c            |  8 ++++
 drivers/leds/leds-pca955x.c           | 19 +++++++--
 drivers/leds/trigger/ledtrig-netdev.c | 43 ++++++++++++++------
 11 files changed, 158 insertions(+), 75 deletions(-)

-- 
2.56.0.218.g1ec904b173-goog


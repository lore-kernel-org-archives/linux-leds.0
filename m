Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209887;
	b=vYkCxkHnD84WKUwv04Qh4Uo+QU5DJDx11SnEY4x6uRXUDyls6++Jjd/wdcLZc4uUKpD/
	 4QXjKG4yvE0b18cNhu3Y9hzanX9DGOnv8WA6nlhEcY7cbu/Dn42OyHIWWphbZyoIllOOx
	 8uBBnNeyKvDi0lgQuaTgDrrsNodFpUBLa82Op5cSy7do/44yyQ1NlYWWVrIPopW1CQ0N1
	 NcVoYD6DlkXTetK+XgyUt41iR1jfzFojt3VrdOhUXWO+8vfSL9IlrVY9dqAK0fl3l2dSL
	 iwIZlPzXgVLKdE7sgs1Fo+o5x3GeN+FmWJ2ukD/PidY/1Ofgwiz8LGhbHaOfB+QJivQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209887;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=5IieO+srsJYomyk2t/trHg9m7DFtEx5t2GRKX+T4Usc=;
	b=rB+XqFY60rJZRPyW+Y4Rb87qSFF4z2p0aTJ+k0hNt+tUrNWeyGfNmR87/3wGxwHoMDM3
	 HWv1Ie5z4krRgOv0A2xiHbXgTFGdx2JA01t0tsdPDaMN+HEy4kMY9clw0HMdGJBWeTUQO
	 0hhBt49Mj8dLaMZ1JqB7iCVfWAUeSmBCQN46vLAfMmFJuQwudJTerRH6i2nDvdZaw7Qqe
	 UxMcOxA1trbi/GpOKkIavxETQfuVJlFWb+PFf+Sfof9I6jCZuECJR0ZIUmJzKcegvWo6K
	 yAp/bjuX9bqLVL8aPmSmpFFRE07NmR0wjALHgIJ6MY56TvwmrCvvI+0XmdPKS/1NjRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=cC1PoBp8;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C543606A6BD
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C543606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=cC1PoBp8
DKIM2-Signature:  i=1; m=1; t=1795209880;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:B7drBGvTHhjsAHzGGhrYodnJo5IZ
   zi83Mq332Gar/6EGCbIXiMgHeglvjfgaP1O2pxaRC9eG6ox7XIqqQwX/HN0sLTeIh1nx5+qUGwN
   uKgFSm0WKC9bs7A7qDrUR4tubTUF7bGfvILkzznXf6gd+2mKGnA1Ti5vz7XfTWY6pzdVNQksMCv
   G5RV9qC5CmMtQIUa7MJTgR3FpN3APKpAdE2cvh7EpIa3Kzvlg2XXBNtV5sEZsr54WHZlRKD0bPH
   TV9o4AHVprKhH2+Nnk6X5lAeDziwAOWNXG/1EGEM+b7lf3ecB50jkt8IKSlFtZ2SaavyKHbVChL
   j+0Je9A1GQiJpQ==;
Message-Instance:  m=1;
 h=sha256:
   hye+AKXEIs9qAdXY/Xu9xnoPLQl86UBjbOoxtazhnFI=:
   LDRW7dy7hV5VKbzVhLSWCeZG/OlYhbfpPWhqIjxwyhY=,
  sha512:
   IW4sLNaQnLEDeJUWtOC9uIqlZJT/B7tEZ4vCakM/u+g3SraxBJ0XHIG6cV54TzWGqdT+wpasMgfuN5YcBJolvw==:
   6lVfey7ETIneuR6zsGFwtKMaLM1la/u3Ll1hfiVYlAnyEb7ty1ACxnuYMzeEZOuqZkChd/z+HENYHVU1Sf5tig==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209875; x=1795814675; i=w_armin@gmx.de;
	bh=5IieO+srsJYomyk2t/trHg9m7DFtEx5t2GRKX+T4Usc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cC1PoBp8Vl2/gN1wdEHGyIICc1nqW/hSGgtnj9SU9wt3UPjFsQ3MDGrfZ3O82EWq
	 /6zd3G0KKiGuiekieUhrRMlU9WjjBczSSlAjN86XXAJTwDjRIql4DAZy6ZAfBNNof
	 b4M/WFR6sFApP0xJjS0e9ArZKkInMIywySXg7PL7pjW2mUFwEzkF60KtQvIlxyOe5
	 7Xynsx8IFDxBXL4YZjAGTLFPG/X3NQfg7yjNtasS1ks2cKBA2EkJ9nUzBL+Y51FXS
	 nysGbHa4c4HONvFBn37d/0T6HcOiBug3a12LjvNFccGoCB5jF04zgSZNu9K3QSWkc
	 Rd6Vkp6/xG0c3ieNsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McY8T-1y79Ek2BMT-00bQIh; Fri, 20
 Nov 2026 22:24:35 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 00/11] leds: class: Support custom sysfs groups on multicolor and flash LEDs
Date: Fri, 20 Nov 2026 22:22:17 +0100
Message-ID: <20261120212431.152081-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cr1l8mcb/nd7WKI3ezPpzfRM4Mz0AVsiL4WLPGtmxjgUlr+nYV3
 5VXLi1F8wOZ3MfrNVQAmmKQbrjRPx+OZDelRkJzGYG/69fwmoK1qM8NhNnkE76YRQCigEIX
 ISDaAjzjD/CYmDMef2PYP4I8Z0uy6R7yPMBXdDcGbIsiS7G/wXC1PWum9X+FKzgIQema7WU
 T7NghsBVzWczsUAV++QaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:stdFiHZz8BM=;YZK08fuNSuxY1kqDHUyPqNZ5wio
 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
 EZdhy

Until now drivers are unable to atomically register custom sysfs
groups below multicolor and flash LED class devices, because the
led_cdev->sysfs_groups field is being overwritten inside the
associated initialization functions. This patch series tries to
fix this.

The first three patches constify the sysfs attributes of all three
LED flavors, while the next four patches fix various unrelated issues
affecting LED device initialization. The next two patches migrate
the multicolor and flash LEDs to use struct device_type for
registering their sysfs attributes, so that led_cdev->sysfs_groups is
not touched anymore. The last patch contains a minor optimization
for multicolor LEDs.

All patches have been tested on real hardware, with the flash LED
interface being tested using a custom kernel module.

Changes since v2:
- fix issue inside KTD202X driver

Changes since v1:
- use READ_ONCE() inside brightness_hw_changed_show()
- fix possible deadlock in led_classdev_notify_brightness_hw_changed()
- set led_cdev->dev to NULL when initialization fails
- call device_set_node() after device_add()

Armin Wolf (11):
  leds: class: Constify sysfs attributes
  leds: multicolor: Constify sysfs attributes
  leds: flash: Constify sysfs attributes
  leds: class: Create "brightness_hw_changed" attribute atomically
  leds: class: Fix race condition when creating the device
  leds: class: Access brightness_hw_changed exactly once
  leds: class: Use correct type for brightness_hw_changed field
  leds: class: Split led_classdev_register_ext()
  leds: Support custom sysfs groups on multicolor and flash LEDs
  leds: rgb: ktd202x: Initialize max_brightness before registering LED
  leds: multicolor: Adjust maximum subled intensity during
    initialization

 drivers/leds/led-class-flash.c      | 153 +++++++++---------
 drivers/leds/led-class-multicolor.c |  76 ++++-----
 drivers/leds/led-class.c            | 233 +++++++++++++++++++---------
 drivers/leds/leds.h                 |   3 +
 drivers/leds/rgb/leds-ktd202x.c     |   4 +-
 include/linux/led-class-flash.h     |   5 -
 include/linux/leds.h                |   2 +-
 7 files changed, 278 insertions(+), 198 deletions(-)

=2D-=20
2.56.1


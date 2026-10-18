Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0FF4C10FC;
	Sun, 18 Oct 2026 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331642; cv=none; b=hPg+cFrOwDigWRtfGOf0unl7/4hWAA2co1nn7SNfHFFssF4aju3mqUCMt5a3t5gj/r8DsmE4gYhlIGW6VR98oFo+pPCwo6iRIgbEvdYh97JyfCRENPSubGXjVFmh3MxW+vPManYio39GveT6+Qj4+0yr7aGvWUhGFsnN0kl5WwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331642; c=relaxed/simple;
	bh=NVXAz0gljlvjs9PMSn+DFZtM7+wTw2MyDFq5tjnv+qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X4HRH7owapAxHkYWYtlYQR3S96pooYpbXyrgf6gnDksvxthNxdk2CM7Nf+sIfiNXdpRHiQKLh/ai9Kc0mZyH7VhYMwo85EnS3/C+etbUqofV233c9qt1urTR3bMBvrdqQyoydfQYCIBOznkYIS2Ei24A3kDwsIcVMdmWcR//n+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rvUzUxRH; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rvUzUxRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331634; x=1792936434; i=w_armin@gmx.de;
	bh=Jq8raopvl7R2/X1XgvsyxqCwiGjyy3ACPYusTtEHcVQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rvUzUxRH1+usQOjU5pCpE3R5Itnn+UpHVIdgSI8bxiNhwwTTSUxm6dh8cFwTALgL
	 aNVPcMgmvIMJCLAtHTtdmFVBX7d8DwPXLPuhGbbnX02p//LVkD4FfQ+FVDNminA8y
	 cXxSHr2XAncad0YsTssLALlAgWxVsZCy+8eq8eVzurBhACIlzg4ahYz6tVvFEsSe7
	 jG5ZTNPr3Ov5ozn3sOjBFmmV1kf4LJqC4e/4eiXV7noXlGWW2vZ4q6HkmzRvcIqbu
	 FmyqyBdoesJxASYilBj2hep8rKajMJRLf4mXsBbjkNLC5EexxhHnZ9uPkZ9nSd0m3
	 5maA3U3upzsYcMBLvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2nK-1wo6Vs3BEw-00pYfn; Sun, 18
 Oct 2026 15:53:54 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] leds: class: Support custom sysfs groups on multicolor and flash LEDs
Date: Sun, 18 Oct 2026 15:46:19 +0200
Message-ID: <20261018135339.1109271-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nhQ9YYarlihv5BAOXOOmTsPMtTsAhvRP6eOCBWW4hF8PSI+VkwL
 SuALRdlZHe3HQpetZuZN1jL0JgN8/iSjtOkTMPfaTdt88zgrxhwRWd15f6czS+wvBG0m1gO
 m5jMH2W/neEwl07DKyyGgTsB0k5pdl32BYeWtllz+kjogR1EN5aw4bVIt2aa21bCTp9U9nc
 iaYIy2nnVOMRaH7Ucy2pw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aMc2/llRtyA=;1J5GKNV6HsMWTyNhOUnFghaCU1d
 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
 Yzh/6BavAIGnfmJQbt1LvUXOliW5I=

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

Armin Wolf (10):
  leds: class: Constify sysfs attributes
  leds: multicolor: Constify sysfs attributes
  leds: flash: Constify sysfs attributes
  leds: class: Create "brightness_hw_changed" attribute atomically
  leds: class: Fix race condition when creating the device
  leds: class: Take the LED access lock when reading
    brightness_hw_changed
  leds: class: Use correct type for brightness_hw_changed field
  leds: class: Split led_classdev_register_ext()
  leds: Support custom sysfs groups on multicolor and flash LEDs
  leds: multicolor: Adjust maximum subled intensity during
    initialization

 drivers/leds/led-class-flash.c      | 154 +++++++++--------
 drivers/leds/led-class-multicolor.c |  79 ++++-----
 drivers/leds/led-class.c            | 245 +++++++++++++++++-----------
 drivers/leds/leds.h                 |   3 +
 include/linux/led-class-flash.h     |   5 -
 include/linux/leds.h                |   4 +-
 6 files changed, 268 insertions(+), 222 deletions(-)

=2D-=20
2.56.0


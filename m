Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE65D192598;
	Wed,  4 Jun 2025 22:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749077969; cv=none; b=hRwDZ+MevMd0I4dFneoECskLzzGKrR/dVMpDjqu7ZkIqHHw9JwmF00JFBQuSFh7vWHy/M6wNi0gJiV5fmlBbCgcUgWxdYext1glv73rOJ9ga24tmcTSOnSMxkwHlB3AJIl2lECRbEGZY6Qk3UiE3P648UxzZwTPisW9dpXDDlWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749077969; c=relaxed/simple;
	bh=JAXobm7Z2dkkQtZcGbD9QGTLI4MilESA4qlGk/KEPD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lANwwRJQnpgjX7UINPFFhB8tWvKWY7ioWqh3wE2wNtGO8g0nUdfODS+GITvkyhGOIG9Udx2mTzHDLAP3boawmwXFt2Z1kdRbB1SmrM/TDkkX5JlTCS9R9KkG3ERXcKVvaDG/T30MXYrtS6zDkUuA1L8WMZGgxrfufqQIh9+CDBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bCNLY1zXYz9sd6;
	Thu,  5 Jun 2025 00:59:17 +0200 (CEST)
From: Lukas Timmermann <linux@timmermann.space>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@timmermann.space
Subject: [PATCH v3 0/2] Support for Osram as3668 LED driver
Date: Thu,  5 Jun 2025 00:58:36 +0200
Message-ID: <20250604225838.102910-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic support for the as3668 driver IC via I2C interface. 
The IC is capable of driving four individual LEDs up to 25.5mA per 
channel. Hardware blinking would be theoretically possible, but this chip
only supports a few set on/off-delays which makes using that feature 
unfeasable, therefore my driver doesn't offer that capability. 
It's intended applications is in mobile devices such as phones, 
tablets and cameras. This driver was tested and is working on 
a samsung-manta which is running postmarketOS with a near mainline kernel.

This is v3 of the patch series adding support for the as3668 LED driver. 
I am sending v3 because I discovered major issues in v1 that required 
correction before review and made some fixes in my workflow during v2.

Please note: This is my first suggested patch to the kernel. 
checkpatch.pl runs without warnings or errors. 
I've read the docs in regards to the led subsystem, 
coding style and submission of patches, 
but I'm still a bit unsure about the general workflow. 

I will try my best.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>

Lukas Timmermann (2):
  leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
  dt-bindings: leds: Add new as3668 support

 .../devicetree/bindings/leds/leds-as3668.yaml |  76 +++++++
 MAINTAINERS                                   |   6 +
 drivers/leds/Kconfig                          |  14 ++
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-as3668.c                    | 196 ++++++++++++++++++
 5 files changed, 293 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-as3668.yaml
 create mode 100644 drivers/leds/leds-as3668.c

-- 
2.49.0


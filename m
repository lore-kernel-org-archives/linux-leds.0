Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E2A37DE99;
	Mon,  5 Oct 2026 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208482; cv=none; b=gD5BjHL73pqW2JXsrRL7XhY1XDmhCErQ0MqtTQkWFyvWTpEk1+Vz18sSOST8agHeTHkk2dwuGKEEoDnN354wn7lgfCjw6FM8RQUUU4Fpz54wIVCIsqUDS175Kccwiz85WMDKY6sCIeJ+IKs3Uc8cDR3ZQ6eRZ1lhchopEXpSiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208482; c=relaxed/simple;
	bh=LeHXcG9KS4npORtxIyRROa13wIKBeufTCVEbgLF/geE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=srpWrpv4M+iW2TQTCiErhBV4U7m5Uo2LlPqQXwnk48mYAO35IRHSqvb0WKc5VraCuCB1/l3TomHBpNRidgujf32t8YCw2iuumVyONA6IQexlLWV5oBVZQshxIRxL2NRLBfmcP+oNSoOc6W4mUf33q3wL1RkxLrfP51PnOh1lvTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=H+Ywe0yc; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="H+Ywe0yc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=THhWSCP3j8arPcp30ni+dC3XmdCk47t1sUp/jlYxkg0=; b=H+Ywe0ycKyqMLxSF0H/oz2DDVI
	B5JXFgNz3zFwCKqktCQuant+qOlj3oUCBoZhGqSpyGLX8+8YKivqJQaPeD8NarhNQxpxxGd4vK0s4
	gSwh0FoLs4/wcTH6rCnnZTDuovXaGE1Dy3cIvmMe3kfXWDnVQm2PXxUgyeyTHfAxZ7/SXr0CKmlTo
	VqAUNO8Ym3ElrGv0sKpRz0XlRRi4tUcc2IeXlI2Mv9H7sYJw6xoQKToQRMweMS1wd0Yl6s9P86cY/
	dxJru4Vp2lYwMVZKZoeOCysLbYWG1LmvM9ScPxHeBFNbXHnbbwm2+uPdqc5tY/z+57lvET7No5ksx
	g7SPGZUw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9E-000Owo-0r;
	Mon, 05 Oct 2026 15:54:32 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9D-000HEr-1W;
	Mon, 05 Oct 2026 15:54:31 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Pieterjan Camerlynck <pieterjanca@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux@ew.tq-group.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v5 00/11] leds: pca995x: Minor fixes; reset, output-gain, error reporting and group brightness support
Date: Mon,  5 Oct 2026 15:53:24 +0200
Message-ID: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28144/Mon Oct  5 08:24:24 2026)

This series adds several new features to the PCA995x LED driver:

- Reset GPIO
- Output current configuration
- Error reporting via sysfs (short/open circuit)
- Group brightness control (modulating individual LED brightness with a
  second, chip-global PWM signal)

The series also includes a number of low-priority fixes:

- Prevent configuration of out-of-bounds LED indices on 16-channel variants
- Avoid fwnode leaks in error paths
- Finish initializing hardware before making LED devices visible to
  userspace

Changelog:

v5:
- Collect Reviewed-bys
- Limit fault detection to PCA9955B/PCA9956B. PCA9952/PCA9955 have a fault
  test feature that works differently and is not covered by this series.
- Correctly specify MODE2 reset defaults for all supported chips. The
  initialization of MODE2 is introduced in a separate patch now.

v4:
- Make code for output-gain range check and default value clearer
- Use dev_get_drvdata() instead of i2c_get_clientdata()
- Use devres for sysfs group

v3:
- Collect Reviewed-bys
- New patch: Fix fwnode handle leaks in error paths
- New patch: Write global registers before creating LED devices
- Add chip-global sysfs groups before creating LED devices

v2:
- Collect Reviewed-bys
- Use full hardware model names in commit descriptions
- Add nxp, to output-gain property
- Fix nxp,output-gain default in binding docs
- Describe rationale for using register value directly in commit message
- New patch: Fix maximum LED index for 16-channel variants
- Use correct #includes for GPIO consumer and delays
- Use udelay for small delay
- Use sysfs_streq() for has_errors write
- Explicitly initialize MODE2 register, clear reported errors on probe
- Set GRPPWM register on probe

Nora Schiffer (11):
  dt-bindings: leds: pca995x: Describe reset-gpios property
  dt-bindings: leds: pca995x: Describe nxp,output-gain property
  leds: pca995x: Fix maximum LED index for 16-channel variants
  leds: pca995x: Fix fwnode handle leaks in error paths
  leds: pca995x: Write global registers before creating LED devices
  leds: pca995x: Add support for reset GPIO
  leds: pca995x: Make output gain configurable
  leds: pca995x: Initialize MODE2 register on probe
  leds: pca995x: Add sysfs files for error reporting
  leds: pca995x: Do not use full on LED mode
  leds: pca995x: Add support for group brightness control

 .../devicetree/bindings/leds/nxp,pca995x.yaml |  13 +
 drivers/leds/leds-pca995x.c                   | 265 +++++++++++++++---
 2 files changed, 244 insertions(+), 34 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

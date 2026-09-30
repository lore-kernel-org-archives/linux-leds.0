Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789444FD7B2;
	Wed, 30 Sep 2026 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778395; cv=none; b=EoCMhc3bv+lgHOQyyq/6OEO9lMY1/hBK8LYwRQcnTl4YGhg9SXHIX44DUSEmXz+FTDmvdLImGk0zQwFFMzCZRMdNRQ2Or7hgarYnjNrjCPaKm1SJMtH+zDmQu2dTNO5kA+G33r76ITYyUpWqnpDJbWOdZEuahtteTomKxjRnZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778395; c=relaxed/simple;
	bh=czavZjY3Fr0fDNP3qT4aa0EPKfhcwQhK6eWhi0XRjRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pmv6WjJvHN9Lp9DJREr3KLQVXH8SvANQJ29VEMi3toiV3PKW/eKYSsD5D3TgmMFOCF/8P+aWvSmQ9jma78A3PrnMNamC/kfqKz56Q83U1+CxOG1iDyLwWxFa7Spn8VVbN73EYh5Gb6A8JpKUI+wH19iBGUtXnlJ3c9TVO/SvMAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lYzLY15v; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lYzLY15v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=8/MBccgFytElkPxPeuN2VBAascX1t7dBbdSdR7WnvH0=; b=lYzLY15vfwexBcsXV/S1UJITV1
	Tnx0AjfwZQjWORE9MYXnsgohcwcW9x6aNzPyj2Sg0r+ZksA6P+5TthV/EMVbvnxNyjXp3Cq39zIqP
	7gU9XKlHLvLu7eFdz2ILJ2HQnuV6RPcCl6Gu8EFtGVoze6YxZfI9YnEZUqOvLne5e/0DPW/Px9nF0
	o4mPMDISLfnNhFb1RIaqeEPbMPpFxzyJK5FH6Slwc9yKlqo3hIPOVRNdR4ERWLyzCtRWPthD7V1Y2
	bM4rYtIz0p8MCn+grRe7zkVtM1JsNzI012Whhuk6o6T0rWDhGpLCmENZepeMpZtfHe8MJz5EcOcuk
	OVByD9nQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvG8-000CoY-2j;
	Wed, 30 Sep 2026 16:26:12 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvG7-000MAX-32;
	Wed, 30 Sep 2026 16:26:12 +0200
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
Subject: [PATCH v4 00/10] leds: pca995x: Minor fixes; reset, output-gain, error reporting and group brightness support
Date: Wed, 30 Sep 2026 16:25:39 +0200
Message-ID: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28139/Wed Sep 30 08:24:18 2026)

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


Nora Schiffer (10):
  dt-bindings: leds: pca995x: Describe reset-gpios property
  dt-bindings: leds: pca995x: Describe nxp,output-gain property
  leds: pca995x: Fix maximum LED index for 16-channel variants
  leds: pca995x: Fix fwnode handle leaks in error paths
  leds: pca995x: Write global registers before creating LED devices
  leds: pca995x: Add support for reset GPIO
  leds: pca995x: Make output gain configurable
  leds: pca995x: Add sysfs files for error reporting
  leds: pca995x: Do not use full on LED mode
  leds: pca995x: Add support for group brightness control

 .../devicetree/bindings/leds/nxp,pca995x.yaml |  13 +
 drivers/leds/leds-pca995x.c                   | 239 +++++++++++++++---
 2 files changed, 218 insertions(+), 34 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

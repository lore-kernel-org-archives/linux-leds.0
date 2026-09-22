Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD35938758C;
	Tue, 22 Sep 2026 14:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088515; cv=none; b=l8m1EHAoAybXixkN6KoQmyjnP+7KIETZ8yar9Mxjp1V+y66+i5PCNwOdphsQrlmHnxMSYsZr6AJ+9tQ7zTbe/ctAak3DTltxpKG7m0X4idaALWG8AVZ3N3Ex5+IV6YkffLQjUjJn4SePK75tLrBJe+kbh4PuIG5lBxcm3jV8Zi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088515; c=relaxed/simple;
	bh=3VjEBq9WpDpZGwcoMYX+zWo99lc2dZ4dKU12pV5si+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HSmCZvbxXjMvTKr44B0VZKarp+4uuJSlcixzQ7a4GdikAMITtMuK334mQ4F4ukb3ynlLCej5WFrvZf/ieoawgF8UqO1vj3mKs5pj/sIU+3VG9htyyG9OPtLRp4BTN1zbvQ9Ea+O7zvKjTC58TfiagEaun8fn321mXKEdCUFy86s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XFdA+51Q; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XFdA+51Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=1HTTKVg1nqJxWsl+HKpD2BrLTuWJc/XHnqEXswQCE9k=; b=XFdA+51QAteMYT5Sx7ueBan18O
	rkhip6o9hHEfGub60UtZo5/1BietdQLxtVO/K000jAjDTK//IoCaHHDuAA66UbnCKlrgLELMtw0vz
	ttaJ5xsFz2Mqtq+UWxirgWeJ79yTVUd3vcpDlOnbeQE7BEPasvmGCfqYmGEDAofPHgazpIpzT6tvM
	ovCvhYXB/fNRqa62k6Uu5Z/Uo3NGkDncbl4iBm90JTwaxqsB7aeXqPHhYfTaZW03DXOuUUyYJlF4P
	0xKNo8maWHrt1k5cZC4FE8x0e9XT6R+7pA3lvTYL+ViwyHXM6cW5yyjFN2iACsUoxdgMMxWfPMZck
	HB3EZEhQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nF-000MgI-0R;
	Tue, 22 Sep 2026 16:48:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nE-000PP0-1R;
	Tue, 22 Sep 2026 16:48:24 +0200
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
Subject: [PATCH v3 00/10] leds: pca995x: Minor fixes; reset, output-gain, error reporting and group brightness support
Date: Tue, 22 Sep 2026 16:47:47 +0200
Message-ID: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28131/Tue Sep 22 08:27:06 2026)

This series adds several new features to the PCA995x LED driver:

- Reset GPIO
- Output current configuration
- Error reporting via sysfs (short/open circuit)
- Group brightness control (modulating individual LED brightness with a second,
  chip-global PWM signal)

The series also includes a number of low-priority fixes:

- Prevent configuration of out-of-bounds LED indices on 16-channel variants
- Avoid fwnode leaks in error paths
- Finish initializing hardware before making LED devices visible to userspace

Changelog:

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
 drivers/leds/leds-pca995x.c                   | 244 +++++++++++++++---
 2 files changed, 223 insertions(+), 34 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8857913BAEE;
	Mon, 11 Nov 2024 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319442; cv=none; b=ehu/dgUTQYE8nschxqfBA6HSaqK3JhYA6n4hlwJ+DcSe7XA9bDBKZAm3848ffGBumgqN98SnOyWL3UGb/uD8jykjD7L+v6dUAM6gDk2K6UzBw16fwNLDZGwekNPsEIPGVmuvSC6zgRrIglnCB5rendzdCACdP00OwH4H2fJpS/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319442; c=relaxed/simple;
	bh=wDZ9Od43ReWkaf/1uPEOj1NBrctEDn8jWd8ZZTV5OAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sR0nxrMsDS50JG0kyXY/FCYfwq1ElWfpvYC/sApLyOMarem6kTHDTMBO+qzQKQmi0GeeCaPAoI1lqOCMkUq3bpls+m7SWEZnJ3+E8VThCXf2DAyMHxxTEt3j1bLwMoyve7O01OcO9gms9WX+aIlgzHQQCK/6B6ZKHGOV3d35Aoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfaydPMk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfaydPMk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B566EC4CECF;
	Mon, 11 Nov 2024 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731319442;
	bh=wDZ9Od43ReWkaf/1uPEOj1NBrctEDn8jWd8ZZTV5OAQ=;
	h=From:To:Cc:Subject:Date:From;
	b=kfaydPMknro+ejZxs23JZ7D45ypwlWDVhtRNrI9JxjkYWMPE0etw88Vhxvk/99zaA
	 RV4/GghFHb1qr3ZFWIPVoIguiNVxDbV+znoZnmCmjhZZiULcgE8Q/kHgQzgHUggi30
	 bjucYRDK/3kDCcpmPD4+XNXDDuTKD4JfBN9Gnw3Zn9aT5wGKtqDaG8F1ikXBblQbmY
	 Yxc3jd3/tgKZhdmU7ClSyXr5COatGFOfsliqFimSVn0ieF+1bak11WVOmrE0yfY2S/
	 qYeGevOJpdliJSKWg46wPqjbjKPaTDWSgYIHAybbnScTLycsVZ5av8dpBf3mq7IyiH
	 apFYMVYOloLPA==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v7 00/11] Turris Omnia LED driver changes
Date: Mon, 11 Nov 2024 11:03:44 +0100
Message-ID: <20241111100355.6978-1-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Lee,

this is v7 of Turris Omnia LED driver changes.
v1 to v6 can be found at
  https://lore.kernel.org/linux-leds/20240902124104.14297-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20240903101930.16251-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20240913123103.21226-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20241029135621.12546-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20241104141924.18816-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20241108132845.31005-1-kabel@kernel.org/

Changes since v6:
- patch 6: fixed documentation comment for the @lock member of
  `struct omnia_leds`
- patch 12: dropped, since Gregory applied it on mvebu/dt back in v5.

Marek

Marek Behún (11):
  turris-omnia-mcu-interface.h: Move command execution function to
    global header
  leds: turris-omnia: Use command execution functions from the MCU
    driver
  turris-omnia-mcu-interface.h: Add LED commands related definitions to
    global header
  leds: turris-omnia: Use global header for MCU command definitions
  dt-bindings: leds: cznic,turris-omnia-leds: Allow interrupts property
  leds: turris-omnia: Document driver private structures
  leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
  platform: cznic: turris-omnia-mcu: Inform about missing LED panel
    brightness change interrupt feature
  leds: turris-omnia: Inform about missing LED gamma correction feature
    in the MCU driver
  leds: turris-omnia: Use dev_err_probe() where appropriate
  leds: turris-omnia: Use uppercase first letter in all comments

 .../leds/cznic,turris-omnia-leds.yaml         |   8 +
 drivers/leds/Kconfig                          |   2 +
 drivers/leds/leds-turris-omnia.c              | 336 +++++++++---------
 .../platform/cznic/turris-omnia-mcu-base.c    |   3 +
 drivers/platform/cznic/turris-omnia-mcu.h     | 130 -------
 include/linux/turris-omnia-mcu-interface.h    | 148 +++++++-
 6 files changed, 328 insertions(+), 299 deletions(-)

-- 
2.45.2


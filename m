Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D324F1A6814;
	Thu, 24 Sep 2026 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252736; cv=none; b=VEr69Uhg/IF6yAOF8KOlDOBzbGwWH5CoWZBPvitKV+bT1KtxSGjq1HT04nxT312XfRnHmbIvQIotFUshFmkMFv8Ad7BFe11caenB1idw4FPoiu7+bkisaRlWSmLQfI5V3sElfugvkeLQXlAMTAMqwy3Cw8e8E1Hp2+ExYa0dv1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252736; c=relaxed/simple;
	bh=mkZ+/fEwSs8YWPIqqniDFLFkK5dYF53u9loFzm82MN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gT30g2TpDDJN2lKDpLVN+wNNbTAjlEnr3HDMjwUP+Jm+ZF2rr7U15mx+TZkBupxQeJxQgbsK/g6Qmgui3v5br9fyy7c8sYoyBZIODndwGkb5HNh+0z7BookUiFa4TpsNBozAADs1wDgkKZNpKAMYeB7xo7PhGGcLJJMV/C5GGnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKtPE3Be; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKtPE3Be"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D311F000FF;
	Thu, 24 Sep 2026 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252734;
	bh=5sX7O3Pnj+aY/dkYnHDMVzgGGk9MOx3gJVPX6DokO8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GKtPE3Bepbg0FpimPIlzjmm/xwig6iO65YdhslFBEIyhcKC5qooxUPGBCTJPNUMqT
	 bj5DKkljB7YfOM3aMV7tvGRX/8y6xUWDB26Y3VneyP95KvoFdtux9cuSDbb4DHnUn+
	 F+Y1y5/5uYS7fKIBp5KdsmJZ1zTV+SygErEQ1YmaB9ws3spCL1NwhR+8quRho0lYzG
	 941Z77g9D4fe5tTRasSlV3OHLZ0qIdd3ga0RMHWb6tTprmhmRRSOHcRJXEnaUboStN
	 dxk2TtI15MIFjlR/ZIIm116UyBmbwlpjv/yuYuMugqhppw2kVmqFWtMS8tJE1Z5ICH
	 dikMgSS4iB8tA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>, Rong Zhang <i@rong.moe>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
Subject: Re: (subset) [PATCH v7 00/13] leds: Add support for
 hardware-initiated hardware control trigger transition
Message-Id: <179025272986.499136.14712876777665893306.b4-ty@b4>
Date: Thu, 24 Sep 2026 13:25:29 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 21 Sep 2026 03:40:14 +0800, Rong Zhang wrote:
> Some laptops can tune their keyboard backlight according to ambient
> light sensors (auto mode). This capability is essentially a hardware
> control trigger. Meanwhile, such laptops also offer a shrotcut for
> cycling through brightness levels and auto mode. For example, on
> ThinkBook, pressing Fn+Space ("shortcut") cycles keyboard backlight
> levels in the following sequence:
> 
> [...]

Applied, thanks!

[01/13] leds: class: Always protect brightness_show() with led_access
        commit: 6887f40dadb5a263de1d9e4b5517400c08089d35
[02/13] leds: trigger: Move led_trigger_is_hw_controlled() to the right place
        commit: 7879d6277485697cf37eb3c1b89ce260d8c67e4f
[03/13] leds: class: Remove hardware control trigger when writing brightness
        commit: 96b4ddd6d2d8c645d672f1f26130685d9f40cf2f
[04/13] leds: trigger: Move led_trigger_group to the right place
        commit: 43b83e7462e8e9b96e14262c0b6aa739f01c38f7
[05/13] leds: trigger: Add hw_offloaded() callback and provide trigger_may_offload_to_hw attribute
        commit: 8e04e5382aa989ae9a36dc0cb3f3c90347d5607f
[06/13] leds: cros_ec: Implement hw_offloaded() trigger callback
        commit: b366a50d39d13f8230f959b457abcaeba1e7d121
[07/13] leds: turris-omnia: Implement hw_offloaded() trigger callback and declare hw_control_trigger
        commit: f5005c7cec7d4cff58f25442ed6dfca56e42b16d
[08/13] leds: trigger: netdev: Implement hw_offloaded() callback
        commit: 072e0e799bc6b3909afc8fd7fac750b31e37b438
[09/13] leds: trigger: Enforce strict checks in led_trigger_is_hw_controlled()
        commit: 7b9a609575615a3ba18a31a95282e756e34bd506
[10/13] leds: trigger: Add led_trigger_notify_hw_control_changed() interface
        commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df

--
Lee Jones [李琼斯]


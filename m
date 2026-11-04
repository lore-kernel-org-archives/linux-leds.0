Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808923;
	b=TMhjKgoK8PYwEVOwVZJ/QFqkXjhyAwZZx9hPUp/Yc9oWNUDPFTNAC2nPsA4GHL0iZdvs
	 rZSZ4jyNWUOrtxSPud1oOgAaNh+M1UenHCQbHNe8mbwYYD2EUA4+qly72g5BddfBWeDVS
	 YDS8Lk3P9ZEjjRJ9cH2bvRazGE+bkos4z6Ix2Ai6fcaslOmWVQfJ3Ff8CLUywQYzEJk0e
	 Si0GRe1TMYLRUVLsweLG1lIHshn0KB/1E4eHNTYLd68BtYgN1tANDlFHdzBId5OoKD3dP
	 4kLmt0IsY/TXQRSqp37VRJX1fFdPdV2Rp9r6ID982uCWr/NT3wwnmqBrpVpUbY6/o3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808923;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=hcY1Uu43KhKPu61zekwZCZY3iUNdgMXeEKBUOnnUUF0=;
	b=UN1zs2qQlF/1KZOPIgp2LTYFWwH2K+4nGL1UtH0KZfAivRZMSN7ynNkzahGMiFx0RKIM
	 DrcTL0JdAwBomI8n+0Cs0K9MUmwDZZjnbtYR7UxQ4JhlxomepTRRq6NBJKNJnOVX2n/1V
	 wq6m1EfQYj82mtAPcp8T8JTTM51lKDtJTUgzp6dpxLR3DNKp84M8q5+yDHRc0G1ZhBBh7
	 4Kmc/91IBDFDSNgTKpFmcKdUO6y8FJo0iVPHsh4xrVD4eBD4oK9PIrfLBQ6Ru0p0KNEHR
	 BgkWWy55CA8qEhWVWSsb7R2YVxBGquukLaLM583u6py45g+bRjz0V+HpaRPuMDChZSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="M/pjx6Ot";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992A4606A32D;
	Wed,  4 Nov 2026 16:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M/pjx6Ot
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800151F000C1;
	Wed,  4 Nov 2026 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793808923;
	bh=hcY1Uu43KhKPu61zekwZCZY3iUNdgMXeEKBUOnnUUF0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=M/pjx6Ot04PeKKujgVEQTPsX4KQFiHmCad45q5DnTD7hZzZNgVxrZKoTfhRigtiun
	 1RFMfP6b/Y8+B9D1ArR9qvnEPJbXqC/epw1/wzFS6tY2N0/G13NN0Svter8QTd6LfX
	 1qSQgejOjambOYru+xy2DdTICfV/Xw4LMf9xwXbcQw9H0v6dCfpWJEpfSGhvhJDRqD
	 gKr0LuU5JAYkkKo96e4LqFtbK3fSUKON0l9BVYliepNZOE7wI5SoPj7FV3VYHPPR4J
	 GyObBtE4UR8ovfZWLBxhCv2P693BWVcMocsPg732c1Ity1mgf5+91t/4yIo9LFItyU
	 wrxrnn1y9A3Ug==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 Ben Whitten <ben.whitten@gmail.com>, Bryan Wu <cooloney@gmail.com>, 
 Christian Hitz <christian.hitz@bbv.ch>, 
 Christian Marangi <ansuelsmth@gmail.com>, Daniel Mack <daniel@zonque.org>, 
 Dan Murphy <dmurphy@ti.com>, David Rivshin <drivshin@allworx.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Dmitry Antipov <dmantipov@yandex.ru>, Eddie James <eajames@linux.ibm.com>, 
 Florian Fainelli <ffainelli@freebox.fr>, 
 Jacek Anaszewski <j.anaszewski@samsung.com>, John Lenz <lenz@cs.wisc.edu>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>, linux-leds@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, Luis Henriques <lhenriques@suse.com>, 
 Nate Case <ncase@xes-inc.com>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Oliver Jowett <oliver@opencloud.com>, Pavel Machek <pavel@kernel.org>, 
 Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <20261021123406.3163547-1-lee@kernel.org>
References: <20261021123406.3163547-1-lee@kernel.org>
Subject: Re: [PATCH 00/21] leds: Assorted bug fixes across core, flash,
 trigger, and drivers
Message-Id: <179380891826.1821014.7246973015946975973.b4-ty@b4>
Date: Wed, 04 Nov 2026 16:15:18 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 21 Oct 2026 12:32:09 +0000, Lee Jones wrote:
> These issues were reported by Sashiko.
> 
> This series addresses a collection of bugs across the LEDs subsystem,
> including locking and concurrency fixes, device-tree node reference
> leaks, out-of-bounds array accesses, divide-by-zero and current-limit
> clamping issues, and devres lifecycle ordering fixes.
> 
> [...]

Applied, thanks!

[01/21] leds: lm3532: Propagate error from devm_regulator_get()
        commit: 4caf3517b994ca96a6e69362d58874318e68c066
[02/21] leds: lm3532: Use dev_err_probe() when lm3532_parse_node() fails
        commit: f8b582269b52ecc8f80cd81a4e05226775082d38
[03/21] leds: trigger: netdev: Hold RTNL lock across hw_control_get_device() in activate
        commit: d6563e5a79bed2e45610b4080d2a185b4426a634
[04/21] leds: aw2013: Guard LED array index in aw2013_probe_dt()
        commit: f8df415aa53ac4671c56e83685cf94f498c79776
[05/21] leds: pca955x: Take a reference on the child firmware node
        commit: abeb74220fefe28ab68789659f554f49e3b4a51e
[06/21] leds: lp50xx: Guard sub-LED count in lp50xx_probe_dt()
        commit: 4160f5a384fdedda2ce534a864bc6eb037042284
[07/21] leds: trigger: netdev: Serialise work cancellation and state updates
        commit: d8a052f6ccab98b456de3441432a5adfc143e1a5
[08/21] leds: sgm3140: Replace powerdown timer with delayed work
        commit: 162ce6b5029413f06b0e6f05d84baf1c0a294381
[09/21] leds: sgm3140: Cancel powerdown work via devres after LED unregistration
        commit: 602c82c086adff666bbec6c133cd4ccea0521a62
[10/21] leds: class: Initialise trigger_lock before exposing sysfs attributes
        commit: ee84e0edd891810874d2de481cd8b937302fb2f9
[11/21] leds: class: Unlock led_access before unregistering device on error
        commit: 54f4bbd0d38e8b5d56a74d98236373593806c06c
[12/21] leds: aat1290: Retain child device_node reference for device lifetime
        commit: 91bf0b65383d14693b5cb1071b341218a7d8b7ce
[13/21] leds: aat1290: Prevent out-of-bounds read in aat1290_brightness_to_intensity()
        commit: 4c664a55d4e15ae256350074ea9df1b04f6c31c0
[14/21] leds: flash: Avoid divide-by-zero in led_clamp_align()
        commit: 6204d67ea6e0bb3885cc76a1c358fdc8e737e475
[15/21] leds: lm3532: Validate LED string indices in lm3532_parse_node()
        commit: eb76e1d62af9376c8656020359cd94e7f7a23284
[16/21] leds: lm3532: Clamp full-scale current to minimum bound
        commit: ef0748fd1e5fd0cbc7fa6e0f21ebcafc967152ef
[17/21] leds: aat1290: Avoid leaking devres pinctrl handles on strobe source changes
        commit: a57e3e4813e89423931d3242031d87294e6e8deb
[18/21] leds: aw2013: Unlock chip mutex before registering LEDs
        commit: e6596ab1148379e9e32efd7a0b5a3ff3bd5f4670
[19/21] leds: is31fl32xx: Clamp channel current limit in is31fl3293_reset()
        commit: a0fbf5212e49f9b4f82f24031112d68f2896b188
[20/21] leds: flash: Terminate sysfs_groups array with NULL
        commit: dce797d3d7cc059c595548b2401a4aa95f45186a
[21/21] leds: lm3692x: Use devm_mutex_init() to avoid premature mutex destruction
        commit: a379f4e0adf2de7b11aa3ef87eeb7d9c838069b3

--
Lee Jones [李琼斯]


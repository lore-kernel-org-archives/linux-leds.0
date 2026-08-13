Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFBE13B5B3;
	Thu, 13 Aug 2026 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630660; cv=none; b=eOwqHZQTsWWJjGVeiTSNihreBfHizjzw3/v7RSooNny1+VT4QzM9aTmwLXISUa0KSn8ld7vaOgsZq7oOnN4VZ2N4qfZgojzDVjqLJ2Uxe20LET7RaMG4cNpyF6Sgr02gQm96TOCEMJm4yLDv3rXp7IU/yOmjhxcNQx1oxsj23jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630660; c=relaxed/simple;
	bh=36yv0SvanAPjlf6Ytj+ZRrz4nIU9Y5K9Bo4KzFA093c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=penqKfJita0KcMBk1/bir55Y+K5cQJ+xNdtPM8uPdPyZVfzxet2zglVwwePZp3HMp+z4uyCU5Eh7+Iy6oj26MOrMHix2iZQTRKkvPT7waQTvleh8A1wypVbVX+x+YuK2KErk4uyBeKiF2J1Fc9+sTrOxx8JMUG8gPwThb36jmwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkMMLaIE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkMMLaIE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CAE1F00A3A;
	Thu, 13 Aug 2026 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630658;
	bh=36yv0SvanAPjlf6Ytj+ZRrz4nIU9Y5K9Bo4KzFA093c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TkMMLaIENSH/IC8kqL07xVvP1ALwR3SINncH09GiPypdrmISZzcDwJzULdF/Xw5v1
	 cDZOH2xVp8AXEeGcoxHWvZfn/qoTrrwqddrMLkmPSYzr8A0jnHOB7wvHQF8fsMuVw8
	 ESKGNhAA4pgBxETmi65xfPziISqv22ARvRDqlhS2TtFCF1rgCAPWsXkSTBNTK7uFAC
	 pNn8mPTTx7mcjmuo1JffxSJvbYsLNqCCqD9ZEgY+ZMY11FJFEf8jCwHjkyxd0xgDur
	 duH1DTVXLBAOWqN3IiCReATYbGuOEXDDFjlgAyX/24pBDavwIV4YwjF5MpnJ0MQv5B
	 LCT6ZZjrp6EUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 2/5] leds: is32fl3207: Add controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <e51da989660502136ddd78779d74b170ad2dcf0e.1786543681.git.ahmadexp@gmail.com>
References: <cover.1786543681.git.ahmadexp@gmail.com>
 <e51da989660502136ddd78779d74b170ad2dcf0e.1786543681.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:17:37 +0000
Message-Id: <20260813141738.53CAE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add an I2C driver for the Lumissil IS32FL3207 18-channel LED
> controller.
>=20
> Expose individual and multicolor LEDs through the LED class. Use the
> default 8-bit, 62 kHz PWM mode, derive output current from RISET, and
> enforce each output current limit with the scaling registers. Serialize
> scaling, PWM, and controller-wide update operations.
>=20
> Keep the controller shut down while clearing retained current settings,
> resetting the device, and registering every LED. Enable outputs only
> after all channel limits and initial brightness values are programmed.
> Handle an optional supply and enable GPIO, and honor retained shutdown
> state.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786543681.gi=
t.ahmadexp@gmail.com?part=3D2


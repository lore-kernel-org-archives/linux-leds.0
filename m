Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488601B4F1F;
	Wed,  1 Jul 2026 16:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922915; cv=none; b=NeyGpTZ5PCzFObeTiLPZBpn8n32nCZaza6jQtfMjODSGfaN5OvM5CgSv6du0iXdYuBfs1MPem/MxrJC5eD64jstv5Z/69SLVNonBypOGPLeK9usCrrH8OoiQl+/SXTGp9c7oFrgSi0MuEGjvcsjwiHBdbUixo7xZnbzT5Ofm780=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922915; c=relaxed/simple;
	bh=IihzCA/spfew84fu8LxSdxSOIvFq2R9ztIcFuF72T3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MSk6Ceh5rpOsoj6OArNGXBMWMEqaOoBnAvvKcqLqtBjgMHeX9IUrcF1ijXf92xYwSpG3T8WUgp1jlSTP5auQMI7rVPz2fFC3qALoBRfyNQOLlAgdKZlfN9sVpi8y9s8fqbDn24gU20rsTyxp5X1UzQqTLdilRU+f4up9oAlsr5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQR7NUgi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQR7NUgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A98C1F000E9;
	Wed,  1 Jul 2026 16:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782922913;
	bh=IihzCA/spfew84fu8LxSdxSOIvFq2R9ztIcFuF72T3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YQR7NUgiSLov8xPfOSsQFkANaTrM26+UvztvjnPTuihlohgO+f/00EYo7LTwKWJ1b
	 fCePu7AyyRsa8Qt5GFOvjeHKOShiqdAeK3pqt+XaLC3Ea/nlLpNcIXwh+4qAg6v9Ot
	 Jm0f2PbWf1pPfDVFw7cndv3skYhf6EdHi9O2edP3Q1VhHzFT1QLAhrvR4R1/uBUJLt
	 8VlixF1xqdXFdGSfrIFSfi+ByKsQtOWmRRR2ZVfIOhInAOxjjOwuEeWTpAi8w5U/hl
	 Y46uwwmKuuwXb1Oo6OOcKDq5GoV2Ifklb4fh+zSqCcWcC0FeqO9mvLOd8uJyoh0YcF
	 785J/zx6p7g6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: monaco-arduino-monza:
 microcontroller LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-monza-leds-v2-3-c1be0b472926@oss.qualcomm.com>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-3-c1be0b472926@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 16:21:53 +0000
Message-Id: <20260701162153.8A98C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Onboard MCU/STM32 implements a led controller compatible with PCA9635.
> There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-monza-leds=
-v2-0-c1be0b472926@oss.qualcomm.com?part=3D3


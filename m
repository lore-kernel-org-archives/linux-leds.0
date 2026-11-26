Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719858;
	b=j6Yw7zm3om9VDauTmNC9mhPRHzWG40DjjxU8L5kSUVH489dMdurXsDIRjpVW1N96MPIz
	 PrjleZfMB+xBXuVDKp1mmM3B+ChMCrCc6Dpq4NMdxX9NPv8hbhpOpRMF5tYb2HsA7yzIG
	 Wi9CHNZrOItjqEy6CmT7BiHTW8anIpy3XPUGASAYG3ouimmLD/OhJpKdcGrOgax+Dv8Jw
	 YpPtCqUpU8lGypB0T8FNhkBsQeVcUNrLpJ/CjsX8OQ/ED/aDnSqvIlcjK8Pul+njbRqxT
	 fOLjUUTktZXDiesGEQV1/qA9Egu8vOhM0jHlN7n5+FIZaqRUgQ/hY0B5kNgeviK/6sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719858;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=s371BytNP354EqwDHREPFqXbjBhzcvgLzpLatoVuTlc=;
	b=GrCiIE+iqHEDAIUigaO7r/I3Zzd6HdQExeV/qAmn6S/Ts0ju36cpWg8E54Oeg2W1WCck
	 tnHpO5jJtxGxiuoH+JogP01bgG+irEGOEJRnh/al9DUKTpVrBsCLseGZ7HgFgSAqzTtKn
	 WeYgAF3YKtUyozT+41aiiwMpwAVKuxNJJ2NaWfjxzP3jDbV2QUztOflcNHdrV2hdYiWUj
	 YCMM5+viNtOjeuCsdGxofV3GbmLNRnW2RUWv+HjxIX8YAVsxzGw0AFm6aogHNDfxuE7Vd
	 A5cy2udWuv/S0eVjpfORCo19arQek1Pnr320AWVucBeCrSDceIJQ+yQ6C8/MeU91rfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAzq0dhd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFCE606A31E;
	Thu, 26 Nov 2026 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAzq0dhd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAE71F000C4;
	Thu, 26 Nov 2026 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795719858;
	bh=s371BytNP354EqwDHREPFqXbjBhzcvgLzpLatoVuTlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AAzq0dhdgHcyiJb95g4+A1CxZqCshlTRGoBZNkJgofKd86ujT/sLWNxb3i4qFFpn4
	 FTn0oU5kwb1KtA4DXNfICBQYtRI0IKsRDnUC+yzndvHJPm9A4m2Km2o/9Zdk1Loq6L
	 R+7DxObUacScPngBDHeoK1W3nT2RNNYiCgaQdCguQTo8dw0iYtOs4W3l6uQgCDb2BO
	 zFFM5sXF+tDiJswMmVX+WFOi+gj9mlF33NAltqAvsTUmsP3Bcb7kUC6wcIJvqiwcLm
	 K5x6OWfC1iTw56SccSHx5J+Gl1D5vEFkLj7XfqR8ulaT3PeD5Mq1Dy/5mNZz4GzYlB
	 xM2n7FDWoUiXQ==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Yige Jiang <yigejiang86@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261030020521.9399-1-yigejiang86@gmail.com>
References: <20261030020521.9399-1-yigejiang86@gmail.com>
Subject: Re: (subset) [PATCH v2] leds: pwm-multicolor: Manage the multi-led
 node reference
Message-Id: <179571985720.19565.6566613190755232318.b4-ty@b4>
Date: Thu, 26 Nov 2026 19:04:17 +0000
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

On Fri, 30 Oct 2026 10:05:20 +0800, Yige Jiang wrote:
> led_pwm_mc_probe() leaks the multi-led node reference on successful
> probe and if the final PWM update fails. LED registration borrows
> the node, so it must remain valid until the LED is unregistered.
> 
> Register a managed put action before LED registration. Reverse devres
> order then unregisters the LED before releasing the node on unbind
> or probe failure. Drop the manual error-path put and return directly
> on probe errors, leaving the reference cleanup to devres.
> 
> [...]

Applied, thanks!

[1/1] leds: pwm-multicolor: Manage the multi-led node reference
      commit: 68c7c6f993cb3c2d999d843c7e732dc35d432804

--
Lee Jones [李琼斯]


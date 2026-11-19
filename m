Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104047;
	b=xsCm55y2ToGQpXFM/cMZpgNiLfnPwNj2JaX81QkFzpWDqLqqqJLh23qds+FuGStzkGdw
	 6LNXftIyu129hE54t3mGRCcW4zIQ1D+JFzOpYfxKTdZbYI6guGYftskMeVQpslkTslHh5
	 trZdHoxHoPY6pdG9vU7RAqlUSGF6zfo1D+AOascJqRvQ5aWsJPUQBXCthHS/u6nspObWm
	 lMC+815GoVPRqsRVa3i1/PY5Z3Bp1Em/VY4tuznCwROa8BJ+3rZB71NMq6kbXRU2Yt5l0
	 6nfib9vsDzIvKOtAKdDyT+wramZm3DtUviSbgOzLwxr5Ogg6ifDzGRIkBzfjIHuXKRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104047;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=a5qv5meWRFQXm/nofYc9pt2fADrMYHdZQ+ZjoDkttNM=;
	b=ghElgrcG6c8glfMwOE0BnmAf8wK9P8mcK/ZGCi9J06PMUbtsWp2UFulc2i8yh9avaUhq
	 lsRq1g3MU8bkoWwJplndc8R/0PVSjYyr4TNK8Lk+2qUcRzVzhLhqWdZkQESC9roKN1iDC
	 9MSxkJpTAPbmaBl8uhvrzOVMP8LIhhtRlBTu9rQ7xK3wrPaoQX3FFyGATFSGVa0HwoDrJ
	 Ac2TmJOYgC/4UG9zs1yznDNJuk59WN96s+PEL0wRgRknjy5CtqRQUsBBL0DeUWCcqWSvU
	 MvKDOgdN2uzHiW7sm25voT7seoa4zHGxbQ73AAJQlVfLL2URGiRW6AmDODfvcOI+bKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TA0NqdRL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5424E606A320;
	Thu, 19 Nov 2026 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TA0NqdRL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED471F000C4;
	Thu, 19 Nov 2026 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104046;
	bh=a5qv5meWRFQXm/nofYc9pt2fADrMYHdZQ+ZjoDkttNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TA0NqdRL0ApPzBxMnNaLp+dBXRJqMfZazi0srwjzLR1n8SC7oq51rsVMm+wrp2H68
	 LvuvM0DTKtx3M1U6dEZemZKYmB/9MWVNPJCd8W0+XpGJwlLEKvesQCuHSNmlIfrcoK
	 GUQ+2MxRy12gxtrZyFOO4Xcx8ZMMnUcL1J86Xg3PP9oVM5Yl+pcIvN4mAJCUduvKVy
	 YtPgBSvwEKh+GE74x8jaWm/zZ+57A9SDX8jcWlt0IekLgU+7w6htVIQo0FkdZJnO7m
	 fPwYQPh3ND21902/1qdgZ8F6w3157yvufqAn/PmYdlw7C01VZQ4IVplIDTE22aYIAU
	 71M+4JTqv7ZJA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: pavel@kernel.org, griffin@kroah.com, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112071732.154585-1-zhujun2@cmss.chinamobile.com>
References: <20261112071732.154585-1-zhujun2@cmss.chinamobile.com>
Subject: Re: (subset) [PATCH] leds: pca963x: Preserve SMBus errors in power
 management callbacks
Message-Id: <179510404552.71039.1312785430890420370.b4-ty@b4>
Date: Thu, 19 Nov 2026 16:00:45 +0000
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

On Thu, 12 Nov 2026 15:17:32 +0800, Zhu Jun wrote:
> The suspend and resume callbacks store an SMBus read result in u8,
> discarding negative error codes, and then write the resulting value
> back to MODE1. They also ignore errors from that write. A failed read
> can therefore overwrite unrelated mode bits with an error-derived value.
> 
> Keep the read result in an int, stop on a read error and return the
> write result to the PM core.
> 
> [...]

Applied, thanks!

[1/1] leds: pca963x: Preserve SMBus errors in power management callbacks
      commit: 304e198fb358e0a8bf446a2750074af6c737c1b1

--
Lee Jones [李琼斯]


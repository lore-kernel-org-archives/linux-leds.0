Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770468;
	b=MeOBTA/vwHAG9lhe1fm0fQ2Vk30HuzPAVPxQH1NCimk7+bocfNx1mhNP8Nrr0b2J+dT3
	 ydaV/miO2ZiX42K5ioZmUvM2YAobhGmyiBlfF51iyINbjg6Ah5hQ2x0IdyzXfpLnOVUxx
	 k1d41EzNDjEf3N8AwPcyTAQxR1wuaEX6IYC32DRH1/kZA106nWFsW9fURyzoN9yfbhMwQ
	 x1iJBZqxQgq+l9GCTQjFkUgQlR3zDC01FAl8xrzJYNK21/E7OZxmccSFR4Kee3I0qK+0Q
	 bL2guxfO+BbYMJsak2fOx21gwPhWgOrkIvXKQzCHjLW3VrQ9tG8D9XmgSHhv8z9o1Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770468;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uZ3S8Ao7kSJ1iCpBN3oyAcUYBbb8nPn9E8rlZOhvkZE=;
	b=ePuRyul5Rcj0oPSwGsen74PHp7qi28GylNOOYs/EqWI7jNpawLpZfDWUD2qqcnMyaR1M
	 +X2TmZ0CS4ujdN8KCH8J5WtLA1kmv3zjObVkVDl6hTGTSQbaOFZvddHyL9OXA2z9toMP0
	 5Gha6NZ1CragMd6m1yMic7vDZNot8Cw84X/8a9Qq9F0w2vjwrOiP8NRGMmSNd0It+L0Xo
	 jE+7pSspsqH6TDKsMKPSg+PlDDt9vOh6hhm25LN3n4NGQelArHZ77+WpU2kbXDYyHIhhV
	 JSN5hrrBhOa5eX874xGA1aijqoEEmAhT+ckieIEHHoGP762cgngu324n7kr7/kThx3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUduasb2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96E606A31C
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUduasb2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9661F000C1;
	Fri, 27 Nov 2026 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770467;
	bh=uZ3S8Ao7kSJ1iCpBN3oyAcUYBbb8nPn9E8rlZOhvkZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jUduasb2y3PeuvbCdFTFZT71uKDHMdLtF7ZvHWKtfdupQmVCE3BsP6I06CG5UPV9e
	 ZtcX+Ul6Z7qwT6ET4zKB4eu7ddlJDHqXjD7yEcxp3GbYDHh+1GSxt/1sNd4lWZ6zx9
	 1JpV4UL0CYb4dJFEqW4BkjdQj22O+oB3rzc1FBKjbpdSIMloRKQzYcNK9VVn4hz1i4
	 RJ3Vq5ap2uF6SJ/kES4q0YhCDmm+3mmKp1VnLGiI9P/y18KsygpykyLfFZvruLmw0A
	 jyPFr5mao69DXeUb7oEV2OAX8P3ys6+X3F3Pzua6OohEtEvrhBW9L3+AECfeguBbQp
	 dXQf+8yQT8idA==
Message-ID: <sashiko-outbox-236945@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: eliza-evk: Add display support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:07:46 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 7-patch series:

- Patches 1, 3, and 5: no issues found.
- Patch 2 ("arm64: dts: qcom: eliza-evk: Add DLC0697 DSI0 overlay"): 3
  potential issues (1 Medium, 2 Low)
- Patch 4 ("leds: qcom-lpg: Add PM7550 PWM compatible"): 1 potential
  issue (1 Low)
- Patch 6 ("arm64: dts: qcom: eliza-evk: Add RPi 7-inch DSI0 ove..."): 2
  potential issues (2 Low)
- Patch 7 ("arm64: dts: qcom: eliza-evk: Add Waveshare 8-inch DS..."): 2
  potential issues (2 Low)

Detailed reviews have been sent as separate replies to patches 2, 4, 6,
and 7.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-eliza_disp=
_all-v1-0-a18be7f65fd4@oss.qualcomm.com

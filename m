Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD74C0431;
	Wed, 29 Jul 2026 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343145; cv=none; b=OGGE+5ekLZWVGTXRZfOAufZURJOIhMbdmHl1qZpNDAOAF9o9DXfJi77dVppX1Yv0M0peYPqjJAiUP0D0iOAgutpjdvx6y868w5Om0urMxyvtu+SmwHykYrypT6f943DD1ken3/noIBGF1CfTLt4WCOrx86mRXErmXV0VjJ+vbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343145; c=relaxed/simple;
	bh=S3H4cIdPpCmK9JBjbex4Gor93P5bePpPKwT0Jr/XU38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=daMw5P3HxOiVBvrXLvml/nz6De/T3K185RQavJ7gq2UBTVd+oQevDktreGSxszN0vqJKKMPww+9tVRWziA6bYKA8cZS8swh+jKVbguYifpTWsVWjsd3gPeuqCq29cyCCBivMtuqqsLhqbp9rLVZO+4aylhUQTJi9Nd1MCPH088o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=M2EPNilA; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="M2EPNilA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MEvcjf+hPSNKYzepNwfqlyyO+EK0h7HWQILOOJ7OSPw=; b=M2EPNilAZcFkLn1YkjNSy1+dXx
	zduEtcnM+Ic8TcvVrjMB/F/dw53SxlmjkJmzer9I3etcukntSsy0NNnkwI2Ghb8wAowtHH3TQO0Jd
	/8ncYtjPKEXWt3MGfL/b8zSVBGEIT26Q5zzyudDjAT445nz4+y7n31UyGwsFRu6iWav+NGODTHyOb
	yndJmocGY4w1nmPodo1YGAMH2wEDkyuqqTY/z+DiQU+0kheQDQo7KnrtJCBf77sWlhNZlemrEen19
	Pl5e4Ha/zdZ/2H3PTJ1WPecopWJ1F6ROUqSL/yH/kHtOPpMo2MyIyYg7fWJsvCThZn8v/yvYFHYRO
	/xEKMXAw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Lee Jones <lee@kernel.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Date: Wed, 29 Jul 2026 18:38:55 +0200
Message-ID: <1954916.R1toDxpfAE@diego>
In-Reply-To: <178419851981.1265391.16595891427832466278.b4-ty@b4>
References:
 <20260711192842.845048-3-samuel@sholland.org>
 <178419851981.1265391.16595891427832466278.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Lee,

Am Donnerstag, 16. Juli 2026, 12:41:59 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Lee Jones:
> On Sat, 11 Jul 2026 14:28:26 -0500, Samuel Holland wrote:
> > Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
> > Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
> > computers.
>=20
> Applied, thanks!
>=20
> [2/4] dt-bindings: vendor-prefixes: Add techvision
>       commit: f0e0417373ca55d07cba596e8afe081c078843ad

I can't find neither patch1 nor patch2 in neither the LEDs git nor
linux-next. Is there a git push missing somewhere?


Heiko



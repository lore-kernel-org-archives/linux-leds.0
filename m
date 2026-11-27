Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761877;
	b=nhJZUwra0vxroFRFBCUGjPmZOQjc9/MaTLtlE+1qZs/XzxZ2Diy+hljOSRpoP7ce5UhA
	 anAHcxI2ld22rKTtZHGAMg4HkQVOAc+awySEq4/ZsifeN4zttcow86vEc3Wb97NGDOvd8
	 k7GN27rfWlInIuXO7YJbQ5bcItw1zCRKQS2EoNdMH1pP0GRDSjIjDHXVIWnUN1BH7SmDx
	 aUFYqLnO9CUh9u+6vhovayaXItQY+IkkVeu/a34nc0DtAhpdejrLV44H0gWBJ4kdneviz
	 RRiUidlq1jcNUw4sDsz+VIQfoa+st9wG3sxyRtOxmbgn/YCH74Jwgc9zra2NAP1K6cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761877;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+UwEWUze64Gn6VlsD/f9swgneYTUwaEG2ACkNVxdqpo=;
	b=DsqlHIRiwMeIXCrwT7OW3QWhujObDIOvvsfhU3zEkJidOH2c25/j9+FgD77NVv3SJ7m4
	 bS5wgQw0s5eTkJ2WIllTyEXWoIOfa1CJLC3Mtw7X+4eKWJu5eoJW8gd6I95t/KLMjTvY0
	 P8E/5mfqH0w6hRY6OFUcJEhPnyyl+/3gHMat/SEwkiJTFrG1NnulmN2ldBG+jlFaZgvEt
	 cp3KSe0dtlxDwWp2nMuj5Hg/zkcDZolq5OZqua/TNHGnq97TDcc8BSf36xKNSPVS7ZnFp
	 gNv4RccXcI5E57aLPCdNtmen7ggA4niuuuiddcNusBx1m4CbMQDvnlziOMcCCLqGttQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3E+MZBs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF08606A321
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3E+MZBs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA51B1F00931;
	Fri, 27 Nov 2026 06:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761876;
	bh=+UwEWUze64Gn6VlsD/f9swgneYTUwaEG2ACkNVxdqpo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b3E+MZBsQPVXnei8c5YH396D2dm63UnQMx0giA3YX4zFeusoYToFpuJS1hSe5H5vo
	 jz6SCkcLkFBW2yVvLWx4YG28PUVVinOgxzbeo/mvDdyxIELrsEyZrmpwdSSypDYWV9
	 ehphw/8lACu8Om0CewCv/zxzQtr0HoUVqW/NNFYtbgtLvXBRJ27j7hZD3n5f4UTJFG
	 BPE7J8WkN/Kg9BozEveuLOeDcxOf4i6Av7KiWdP0CdewOeg9Nde0BUt8eP1vpchuB3
	 MyOBtOg+nDME22kQqi2KEtaNOyFjqYIrpqi0Nsd0uhJt94huJdV39FvhtcgRhFrjNI
	 tk8PeWK3tqdxQ==
Message-ID: <sashiko-outbox-236759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 0/3] net: phy: dap8211r: add LED control
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
References: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 06:44:36 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127063708.3074=
433-1-a.shimko.dev@gmail.com

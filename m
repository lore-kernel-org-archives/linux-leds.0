Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437849;
	b=UHAaK9QxLXiJ0f5JPh4SEJJg+y4AyOh7BbsEGti7DeTq6xfuvSGqJeRyj8aXDUrEspip
	 kFcZnMRYoc2ZUHEMtlKogHh3/olYLhaOGMDYvy8Oi1Vtogw9cyPlUCqRiGY/31lwgirFX
	 WYY+/vj9d+oG5ByiQ/FI23w+STEDLwbsWNk12/JLKEcuE9nAnsJPicSwUHXxyxw0wiZQ4
	 H6FNDlekD93moFJv+Oc67dHl6qlEKlNh3/j6e5qnan5aoRfwyyPPibxaFpYSVhN2OFLzB
	 FF2MYljPflkACCqRvAA8bUt63eeZc6/NR6nH0eoBW+CeI8dGwAZKoKBHeoVbyvO8i/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437849;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zf1njH8psK7+1MQ6kKSyHSl45rKMSyXGrS/iVJfBgJk=;
	b=IRxZBXXoauGvOd0IOgHwmImBv7MdNsqi2FJwx4ahahS/fmmfZ4ZLy2otfRKYVjstDNml
	 ucYHmtHVrId+BQVyLK8g/SxqzF9D6rNuFbR2TzvzXmIYiIj+HZXEBKBVPuk7rlDZQOKrC
	 6QC5tD2TAkn8kfTXFtBqe0xhM3YicnmmFQQFlJm78OgH5lApVGIodYYZuMWr+1ckf1QcP
	 /00TCZ62InHIm3kaW3Neqqny16AUTQcresxnVcAq1DwlrTLewhcCM1yhOlgqW2EyRkG1b
	 l9q5NR2ogSuL49ixXRjFAAntKpauFCNoQRyKS0n7t1LzAUUwWnZWBKXSeKgbltJJ1kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrYOf2fF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7643606A327
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrYOf2fF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614061F000C4;
	Mon, 23 Nov 2026 12:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437849;
	bh=zf1njH8psK7+1MQ6kKSyHSl45rKMSyXGrS/iVJfBgJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hrYOf2fFATqSXj/7+xGThrzl5CX/z+5HgwbBUaQDdlIYf6yIq0JMT1+CFkvCJCzRA
	 jTjVv8Q1VsAcyCYuw1yvlCGMwNx8kB9MBsGSoLJWbtNqDVHyvTVXgv2aQNkmuBAWsi
	 EzncjKtSppeJ6avfN5BBkmXxk6Moqc3NSC1EoElaWnSSOohP9dGaH1QwCh7B5C+6Ca
	 iroqewUyqhbMAkV3egic873O+Fh7BGXCUCOE94QnAFSkKEMeHz0i1bsXVp83ZD01RQ
	 fF6SDkaGDKv7ZP1YG4NhvVeouVFavptf6kHcEobADxZY+ZDE84depQPnqDynrNlbRF
	 icVpFMif7YNJQ==
Message-ID: <sashiko-outbox-229243@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/3] Convert National Semiconductor GPIO drivers to
 gpiolib
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
References: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:44:08 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-b4-nsc-gpi=
o-v1-0-b2d97eba2662@kernel.org

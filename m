Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575683;
	b=cuA8GkdwvKcZQYo84N0nIMn5nPSUc3qSlm+RB+IOq2wkc4aTU+n/VsyJQ3cnXLOmNJeX
	 MhD8OtWCrMxZ979axyldX8XXoKW47pSl8BuTAUu8StREtHBHPn5InvrjsN2WsG3ttdc14
	 dGfpoEmUuq1Obmiv1+dCEf0ieabPefCNG2aqL7GKBVSW3bHFYCLDyejfz4hsJR8JUSD3Q
	 Rrga/rddBPETZjQ30RUK/aHIix/v769aLkqjjg3S7FYU2bentNLAi7ZADrTp6UUJxY3F1
	 KRlQL66W51j2X6KGc62QYId7dMcko+DHJD7rREu08gW0udulTBWZaLPsQPyO0EcQWOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575683;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TPO+R3thzPxQgf9DrBuSBzE6PC5fK7jKh86d73REbgA=;
	b=bnV+MlS6QPhpmtkiqPHbdq+ktcnyLLg00IGmy0rSsasQA213z1h7v/dUKjzr9VQlhkqF
	 7IXMKiWGyN15tqYZYnI7ahLGxV5YF7ElIezXXXOIIfqnqbh16vgDeNryaiJr7qyCt1Y4U
	 GNAr8nXsqoeDoXUPDlixa8AgzJI/7jpCo6LrI/pr4CoJcKGM/X3noo7NUzGB2FWonZNdz
	 uTcHrUcB8TItnUdn+0Gc86QPil8ZYhXRnu9+8u+NvAin+0v00VNq91GsKx3zJ0GY8WO0v
	 YtUztJoASEZZqxsEu5E+dM8KQ/Q/2OzHRc6W0iADicScZRFxSAfUN9hWl/2ZBAKD14g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UpEn/Iqy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0A606A325;
	Wed, 21 Oct 2026 09:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpEn/Iqy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9F81F000CA;
	Wed, 21 Oct 2026 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575683;
	bh=TPO+R3thzPxQgf9DrBuSBzE6PC5fK7jKh86d73REbgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UpEn/IqycnjTZeflPVgIgxOiYJcslS33OUkDey9yiSnNPnLBJaYhPj/Tvk+mrJvSv
	 J7JoJRotfrDL9P58L3d7SshPUrspw0VStjDURtbSECNFzabLEhC+RtSy4mCIOL4Y56
	 UXV0KEGSLsnTznCEU6MrWHnY4ZFEAPDSGPjsTqFVhqY3c7hi0l9K2LDnF0G3lPuZhp
	 lK9St9sVGc+mGE1/kOVyda3hrCX0KvzTayPlorRsC2LsEvJojbG/UAXsisIYUytLPO
	 JoxWv8saEz35FxPwAWcchuI7b5jEuFMOf5nsO2APEuUWdxnSFYGcNBpUsuYVUa/wyv
	 +0onhIEhf5+gw==
Date: Wed, 21 Oct 2026 10:41:18 +0100
From: Lee Jones <lee@kernel.org>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 5/6] leds: aw2013: Prevent writes to unpowered chip
Message-ID: <20261021094118.GF1795367@google.com>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-5-cab1fdd050b6@postmarketos.org>
 <sashiko-outbox-169017@kernel.org>
 <20261020101654.GF1206986@google.com>
 <338bdb9dddd9cf502a05ae8a79ccf5bb368b37a7@postmarketos.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <338bdb9dddd9cf502a05ae8a79ccf5bb368b37a7@postmarketos.org>

On Tue, 20 Oct 2026, Paul Sajna wrote:

> October 20, 2026 at 3:16 AM, "Lee Jones" <lee@kernel.org mailto:lee@kernel.org?to=%22Lee%20Jones%22%20%3Clee%40kernel.org%3E > wrote:
> 
> > > 
> > No more reviews until Sashko is clean or everything has been reasoned about.
> 
> 
> Thanks for the review, wasn't expecting anything until I fixed Sashiko, just didn't have time to circle back yet.

Totally understandable.

A very short note to that effect would save us all a great deal of time.

-- 
Lee Jones

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422042;
	b=IX2THMs9WpwSNaMNsJt47jrNeZc/2/E6pkXx+EAOLcRCns2Bcz16mxCIMei6wziCqopE
	 O7AwYw0IAuOb4KKDVvrscnnoHacRF9GSbdzVxbJuFAnYJ5zrLYA/gpceqpvlp60S8u9cp
	 vLHrc9JaVabnI7WkcLTk4X0/1Fef7AiU0fOEG4Vk6mXnZbsFwkHd3aZcyfYJGfVtBcKRN
	 V4X+vIAi4nRFIMq9Z4dPQac9x1hq0pepUAJSSeJv48ihHY9/M9HPFOAShpuqWSCg4fdCh
	 zMNDqqfVw1V3/Nmiwnp7U3paokvBST21LTozRgdTfI81q6Ydvlg4gExumbnJSj5yJNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422042;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eLQVCutdJd8bB2NBu05oLr5V+U6voBRN6jKxmcp/n6Y=;
	b=ApxyUVUC+JAwOIw4DegXQKVW5YrjGjbKb8UXrSogCBpVcvdAZ9+n/JPCwH/TEbrbL4Gx
	 yR5xmiUky8dt0Wx3OB18cghFs/DMU2OErXba/Lgz4jVVS9MvqB1Tmh3XmNsYNpix5bnix
	 h+BFtDLL+H+eEQ/4PewpQyz8GLDRy0FEiKCIVIPkIv2KDNODFGSZNIDGTgv28r/yzCXeW
	 2hieOnHLXqQN+/Zcbo25lZUdyCLoO9heITwf/puxH40HFYz/iF6Epa7jB3CFciwUea4nl
	 R2XedWtg47puIJ3rKC3dCRO6Z1jH/iGz8NWKMUmzu51lXMH/GYlTCqvcmVUxPrA9PNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=avA7M3eV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22046079D6B;
	Mon, 19 Oct 2026 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=avA7M3eV
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB0D33B975;
	Mon, 19 Oct 2026 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792422042; cv=none; b=g5DGpuqilhCxymYCBJ89qDf+h/ZDcBy9vB3Y+Merc98w5jZo95rYobj5s4Z0DCzboHLGRuQx6gMVZ4Dgngcwud48mZtsg6f3hsXuizwHyzRnmfaLG/GWqe14nbRUeVM4aphMgglvoOOaR0gYV5f7VfhXRk3sVczz/TIwU/kzCvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792422042; c=relaxed/simple;
	bh=+aYBKfPsbsJIuTyFavgifgMptElZ7ia0bECdrDqcjlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPbQO2Ydpk/FPM1J93LunwQoqtapP9zDUez48lGyyfThNrqk+51RNUZunsVHdTNOl4reCkX0PbkHKvlxx80W8SIE3yBjlj7skBQsrosNaxBlADjVwku4dSTS2hJ4/egH2aVjjRm+6ZVwovYDfzHG+LlUcdfwgqkjU0myHlymr6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avA7M3eV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DF61F000C4;
	Mon, 19 Oct 2026 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422041;
	bh=eLQVCutdJd8bB2NBu05oLr5V+U6voBRN6jKxmcp/n6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=avA7M3eVmIy/Qm9IgQaU2n4DCYv/9zsqHiq7u+c0CJRZESQsq0vD4n07ZDmv76rWK
	 DmY1nPCDrsGtP5MVQD4kD03aKQ9snmGQRJcbo0WYY2F1pfyvMyQomHE+VuWI8cLO++
	 d3+FzMEDzXdPMXDTOEPK/WqR9a+aBPBZsODJr69PsshdTPJpaJ8cMOyLQCQkKhnpyq
	 zM2wYhI8muIqs0qrOPHU/nUqEri8FH5JyMt8840Hvu5FM5YE9SlmWf2V7UpVqy3FBp
	 4SuSjc3VFbL6ryXKIx9626x45RIJ94Q6j5PyXJKjzOf6YDYgeejjBCZrOAW3nNX0K7
	 utuJ3XwnYnASw==
Date: Mon, 19 Oct 2026 16:00:37 +0100
From: Lee Jones <lee@kernel.org>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: sashiko-reviews@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 07/11] leds: Add NVIDIA LSTP LED driver
Message-ID: <20261019150037.GD2663669@google.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-7-aambrozewicz@nvidia.com>
 <sashiko-outbox-168489@kernel.org>
 <20261016092821.2049721-6-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261016092821.2049721-6-aambrozewicz@nvidia.com>

On Fri, 16 Oct 2026, Adrian Ambrozewicz wrote:

> On Mon, Oct 12, 2026 at 05:46:52PM +0000, sashiko-bot@kernel.org wrote:
> > This isn't a bug, but the commit message prefix seems to be missing the
> > driver name. Should this follow the standard format, such as
> > "leds: lstp: Add NVIDIA LSTP LED driver" to help with git history
> > categorization?
> 
> I'll go with whatever Lee prefers here.

`git log --oneline -- drivers/leds`

  leds: <device_name>: <Succinct description starting with an uppercase char>

-- 
Lee Jones

Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516831898FB
	for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 23:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781133180; cv=none; b=DRZgBwaWz3Tc8ezzJY++DlT5i7/aokNYlyysBzBVQ24QsdskiBxuXk/SG4EbKw/IxVEsYonJjM3gj9gf/lD6lt5uMmV+TVVbCDEuwnBhYVFhON6XU+4NqbkbGMkH76WR+eUG1Hi16c+qUyBZsv3CDASIvTBMpz9FatPaURuLt5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781133180; c=relaxed/simple;
	bh=x2w3u68elFhqkinyuYXJoYkQ+RsTTlc3U1Xf8eRKgQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnEiiyDGY4UgbxQaa7WcTZBRHaHWEEGAOVKklTA6/pckXvnajpVAS0IoymIwy3Q2o8i1sLTy7AnArm6KeM9IR3OVLHaS0IgbMBjiLSKM8aEPvk96RlA4+HEIIoD79pTqEWOeIRWfjFEV55/ofubfCZbNZoncDbkg6YQUBILDI7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=rKHLPfdQ; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="rKHLPfdQ"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A92BE327EE9; Thu, 11 Jun 2026 01:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1781132659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=as5nK12NpA4CPp6QlxIOnqvyCmSkgtPLciGWopmTqwY=;
	b=rKHLPfdQ6nWxr2cLfsbI4JwwtTUoMIm+JhqibuMH3Hjzv8qmNZypECxhIy7eEmZMWZmL8q
	466I0wJDljslUR+JsSJePMQNLNLRBnmWVba3azfRlnlocyoH93jzLPscRavXElc7kDj7yM
	oAMrCOv4zA39daV/pMhF01yiq10N6mM=
Date: Thu, 11 Jun 2026 01:04:19 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Lorenzo Egidio <lorenzoegidioms@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: tests: clarify name conflict test It is a good
 practice to use a fresh led_classdev instance when doing the testing.
 LED_REJECT_NAME_CONFLICT rather than re-registering the already registered
 LED class device. Besides that, do a zero initialization of led_lookup_data.
Message-ID: <aintc15RHlD5iU2m@ucw.cz>
References: <20260610172107.507-1-lorenzoegidioms@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610172107.507-1-lorenzoegidioms@gmail.com>

> Signed-off-by: Lorenzo Egidio <lorenzoegidioms@gmail.com>
> ---
>  drivers/leds/led-test.c | 102 ++++++++++++++++++++++++++--------------
>  1 file changed, 66 insertions(+), 36 deletions(-)

NAK.
							Pavel
							

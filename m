Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F23363C45
	for <linux-leds@vger.kernel.org>; Fri, 12 Jun 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253924; cv=none; b=A4z/R8G5ra4nsNu/R1dqBr8ONEzmyLW/henMjRONNohk6nETjaooeECziufSy82xmA0nzBDZ7S0KnqyOwYRpLdabhGJxDuKbBk/EI0dQYTFduVVEkOV4T9cd/tdWnk5vdqLJ5Wq1DxlGn9gePCBlriXRS3rRUTo1XOBQLTj1Z8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253924; c=relaxed/simple;
	bh=NX3oXiGmqiPQniWWQK3ikYQssIfJUimVUQj8ASfcauc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu9NECB4pmCknYr76hQEaCNe+AiqeLzENTyL+B5VeMoiLu83h3bKlDtM64PO7nnpeAaZIjXuhM1YgAQlAP5D/zPOQw9EtSQZRvQXfLSVU5ZGo+in75FTELSXmaOs+tqTtVNlV0X5SWVGR1IRSu9qvbTvaZlZh49jyJ/y/y/uHMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPcqvvrM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPcqvvrM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D601F000E9;
	Fri, 12 Jun 2026 08:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781253923;
	bh=m43GmAtF+MNYOHZ2i25DDAosu/Sb8ErjziI3wjuQ/a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jPcqvvrMV0QRQ9ALGp3KX9PsqA6/6DFdlINga8urJEgLO1jJhAhT8T1Eae4EusKeR
	 qKyP95lIO2g3msLW5PglGj8QrGiE5Gf3gQsDD+QNHa9P0+8ypSBy0QKwv7ATWmULKh
	 zVedpfXxE4XdLWjCaPYtfT3ekeGn43tF4zKqFLVg/8RAi6/S4kD8PLdavVYyqqhLlH
	 fqlDc1HIa6nqnF7KtQcWfs+hQElqMUKnyJ7gPgDSsWea2L8Ax6bBHT5tyIwL6dgbv3
	 M9SPLFYcmGXNB7epOl5V+vOlWcX/FoZhi5AgeqWZ4XJW1Eivo+dceqUZM+MIfyOTZj
	 CDIR5dDhakM3g==
Date: Fri, 12 Jun 2026 09:45:19 +0100
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Lorenzo Egidio <lorenzoegidioms@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: tests: clarify name conflict test It is a good
 practice to use a fresh led_classdev instance when doing the testing.
 LED_REJECT_NAME_CONFLICT rather than re-registering the already registered
 LED class device. Besides that, do a zero initialization of led_lookup_data.
Message-ID: <20260612084519.GE1212816@google.com>
References: <20260610172107.507-1-lorenzoegidioms@gmail.com>
 <aintc15RHlD5iU2m@ucw.cz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aintc15RHlD5iU2m@ucw.cz>

/* Sashiko Automation: Reviewed (0 Findings) */

On Thu, 11 Jun 2026, Pavel Machek wrote:

> > Signed-off-by: Lorenzo Egidio <lorenzoegidioms@gmail.com>
> > ---
> >  drivers/leds/led-test.c | 102 ++++++++++++++++++++++++++--------------
> >  1 file changed, 66 insertions(+), 36 deletions(-)
> 
> NAK.

Definitely, but can you give the contributor something to work on?

-- 
Lee Jones

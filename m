Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F1C3DAAA9;
	Thu, 27 Aug 2026 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841396; cv=none; b=HQhedpns6zrcfqZ6lAFYoWFwDb6o/mLPTy2qUfXGapyQpz4APiIjV7UGN46YrwiyOKr3SdnSo1H5WKh0PPmz4SU3KWECqgnMUUIdjlAKl76/fxvjmPpahdhMk243H1JG6D/LY6FVFNSIU7bPfYLwjRJAvzC+rQnQnOEO9Xl2xu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841396; c=relaxed/simple;
	bh=1veJcetOXwNOB6kXa0AoVSPx+UdZMo/fE0XEAzXLLhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XX2wbyJxALudtNLSEH2ZzULuY235J/pfncYKvpDugW6B41TnkCvK0Disp+SIoDRA0qwExGAg8GOc2iKfOh5rocPPJF0oWuNcOQnjkE4dmhCLkMF7lwvJmGUB1/EISK4Izi0HrGll+oLiEEgBIVYqEsbQviB5ci2UwMl1/3S6HEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ng8E03nd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ng8E03nd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51981F00A3D;
	Thu, 27 Aug 2026 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787841395;
	bh=yC0aJm2aE+P+RxSBAqes9W7jNwZE7YBdpOJmkhVR/Ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ng8E03ndh+cusCw9k7rhyh5oHHxp1OmF9jGQ0GIG86gV3769RIxkJRvczyQDeHvcq
	 MBgNXWHWurAg50vdcCW0l9d50ZwdKyM/uEmsKeeCQO43ScaIdGZIJyrtr5Kq1FcYsM
	 ErCTCaroHyQBZ3TZaE9UZVJDcKyUxltmUI5sRcAl94u0b/RaT3M3Nu0W5bV9U63I6K
	 wDlM+BIJRLXkZ6a4qdf9jwVB5CG5nCZvZ0njuG25Pd4jLm2tVtcNCjRcFsZ4sDPBo9
	 3QAmNGLpnR1FFa0S1KTcX63F5qvniolz6Wv62sjj/8fGxnLvXQ0LCpUR9bxuoKh7cK
	 5NL+ns84zyN9w==
Date: Thu, 27 Aug 2026 15:36:31 +0100
From: Lee Jones <lee@kernel.org>
To: Steve Dunnagan <sdunnaga@redhat.com>
Cc: Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: gpio: Clear error pointers for skipped LEDs
Message-ID: <20260827143631.GD2943942@google.com>
References: <20260710150841.19669-1-sdunnaga@redhat.com>
 <20260724180412.43150-1-sdunnaga@redhat.com>
 <20260813154559.2407-1-sdunnaga@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813154559.2407-1-sdunnaga@redhat.com>

On Thu, 13 Aug 2026, Steve Dunnagan wrote:

> Hi Lee, Pavel,
> 
> Just checking whether anything else is needed for this v2.
> 
> Linus Walleij replied with:
> 
>   Reviewed-by: Linus Walleij <linusw@kernel.org>

I'm not sure what you're asking:

https://lore.kernel.org/r/178602432127.2934315.922699465700010447.b4-ty@b4

-- 
Lee Jones

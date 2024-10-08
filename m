Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24BF1DF74F;
	Tue,  8 Oct 2024 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398173; cv=none; b=kvzhTPrDkwFhQw43HSGJA0buBkkKk++c2cy2qIOdbL5SKB/zi6rw1V8GA6S/XRWQqH6MQEIV07rrMgQl6C7ktQwx+cWzw4mDw9oLpbyqs9wARhWbMxep0oWCPBeQjkQIQzQKlGSOueOSn/m5AOdhireXd5lL3+s4NRIHVZZsMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398173; c=relaxed/simple;
	bh=XFTDVxdUiWqYsPpoEERzDy7hronrGo3f7N9SxVo8K6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5nZFnkQ5JumCS2bQCsu3yNJat51zLBF0bQDbo4a2GNKRFJoWVK/pbe6XtJ+f+QD6x+WgfhTuNlUe9JR1X9txoKJx3DPOothaZTUqMZL4aSBwfxfloKvJOayzjpW/t+21EZ3jhVCy07vnuEngBC7uvK05Qb+PowMjpGbrcfAMPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAnel8LY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAnel8LY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8FFC4CEC7;
	Tue,  8 Oct 2024 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728398173;
	bh=XFTDVxdUiWqYsPpoEERzDy7hronrGo3f7N9SxVo8K6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAnel8LYL9XuGoiYmGeTFvz2f1NZHk1fFFzV4gszFA4sAyLeTjbV+N3B5Ps0R1i9C
	 KXk8mBSdsEx4mSNpguTCCkTQmpVH6IlV1RFLnPwzft9sIIrKDRd0Rl0kadxxyy+xg3
	 YUAFp+agN0Ab6aD76CIC04IeTAopg5gU1ovSDELK81NZ8he1/8HmFxI8I3EQjH588J
	 YtFzZeCVlaGZ8q9pkVKLc/Mz+aPHv+uijdvik1lXuc8Or887PBc813oEdYPqhlbCSY
	 lqfd/REywkAFQCLYwd1WpQ2FuFAxBE6AuFgCX2lpNHT4g2vH7oDxcivZl0nHGFFcza
	 bckzSx8se9eZw==
Date: Tue, 8 Oct 2024 09:36:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	conor+dt@kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: Document "rc-feedback" trigger
Message-ID: <172839817228.1284212.5694841643473345087.robh@kernel.org>
References: <20241007205315.2477060-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007205315.2477060-1-heiko@sntech.de>


On Mon, 07 Oct 2024 22:53:15 +0200, Heiko Stuebner wrote:
> Document the "rc-feedback" trigger which is used to control LEDs by
> remote control device activity. This is an existing trigger used in
> existing DTs, document it so validation of those DTs would pass.
> 
> It was originally introduced into the Linux kernel in 2013 with
> commit 153a60bb0fac ("[media] rc: add feedback led trigger for rc keypresses")
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> changes in v2:
> - put the entry in the correct position and comment above it (Pavel)
> 
>  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


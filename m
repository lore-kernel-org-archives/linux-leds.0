Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133FC2F747A;
	Thu,  9 Oct 2025 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025764; cv=none; b=s0FD3wVFIrHsrFDRNJGitMfNSeMkwItXkrqmOr9gzx1L+wvnrgyZfC/m4qBACZ+joS3s2Y2He1JGLLclZ8oKrbhyD73VARTugyxV2+qywUgB8AS4JJd12CKfZ7ft+HU6eZF/jbWIDtISjeRZyFT1khkQGCCWpkuuFHfWW76UVcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025764; c=relaxed/simple;
	bh=D8alwxEf6eN0ISJVqi4u1LipsMSeY+cjik/4BEmir3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTxEeHoCBhoHCdDhbr7gfVBx0+7MQ4IE3xtxGdtc6sFfSLDKbm08XULi5dmyyfIeCIG5hQV7Lb9Bi3BH8l46IgegLV0fuIhjWILrQYlx1pmxBNC3NQQAzLTVxIXnJmw/fr0QxCzpJdfkc5duAIb65XkyCcQ21iPGG0l7H6dg3JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ju7IATZ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ju7IATZ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A1CC4CEF8;
	Thu,  9 Oct 2025 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025763;
	bh=D8alwxEf6eN0ISJVqi4u1LipsMSeY+cjik/4BEmir3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ju7IATZ37xzo7nJnebGBotpVtIuK5ktTU3wUuP3JpBl9R1gWWpGo9WNIbKZ8UlOqP
	 fstykNTTf0ZGMwnjvt6L92Ms6SdyMSv0f39G8H8uOHZ+oF6GRH2Lre+YGct48Epi/L
	 GUFHqQXGjwapOuZ+xApvscsgbmfXYn48x6MN721iwg+aEkjoa8yPUnvm0ab42IBAdw
	 ubQgT3ytKa1pSrCrY4UsBs2qaVcUqsHRNSxBPr5OtaxG/J/kZC/KxG4RRvmN+oJ+/c
	 l1/dp8Kz9L0lB0Vd4an+g20Al3EpsyrTEe7pY5nFVE/aoTehh2hVKDGJQJ1qs9SAZ+
	 P0OD6OSTsYNXA==
Date: Thu, 9 Oct 2025 17:02:39 +0100
From: Lee Jones <lee@kernel.org>
To: "Sicelo A. Mhlongo" <absicsz@gmail.com>
Cc: pavel@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, maemo-leste@lists.dyne.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] leds: lp55xx_common: enable use without
 FW_LOADER_USER_HELPER
Message-ID: <20251009160239.GD2890766@google.com>
References: <20251006103954.243150-1-absicsz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006103954.243150-1-absicsz@gmail.com>

On Mon, 06 Oct 2025, Sicelo A. Mhlongo wrote:

> Many distributions disable FW_LOADER_USER_HELPER, and this configuration
> makes lp55xx LEDs completely unusable. Enable their use by only implying
> the user helper, since the basic LEDs and the hardware patterns can be used
> with only the sysfs interface.
> 
> Tested on Nokia N900 with LP5523.
> 
> Additionally do not refer to the sysfs interface as legacy anymore, since
> it might be the only one available to users.
> 
> Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
> ---
>  Documentation/leds/leds-lp5521.rst | 2 +-
>  Documentation/leds/leds-lp5523.rst | 2 +-
>  drivers/leds/Kconfig               | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

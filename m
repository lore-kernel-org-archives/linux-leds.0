Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFBF47B435;
	Thu,  4 Jun 2026 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580474; cv=none; b=Z449TnAD5BthS4BHCG04BANjY+eFmHxglNtd4UjY+fanlqKGm5kONRsA6goeqnLIudY40i/mBy/jGCZapMksy+kVP3S0BrTwl9IsFl0Igj6rKs3OaQ67fTNa/9MH3eUv6gP0DyWvdRcxyHH0IQiUUWMZlUaGSbF7cPY9CmJnk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580474; c=relaxed/simple;
	bh=udhPSa/8KNRAz3E7J8Hr6RU/EsdQE8IWfZLE24H8d2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YrwmXwHCbb1D3KM9J1LLMMfu4L1Ft89G+gJr90shjabC2U6cST0FbOIpGt6J5eJWVwtQigyk2b9UzjoHZKTi5/ev+ZB13sUtTKN8iLsysis0upNjpWZQDbrdn+/W4CYJIzTFgWCmB1EHnrFgbvc8u5xMil/XQEKWuR6ifVP3Qbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsVFmzm5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsVFmzm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D051F00893;
	Thu,  4 Jun 2026 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780580473;
	bh=zOzsmES2+XqkfH47uS90r5qpHz9BTlcN8pxvb/xrrQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TsVFmzm5R59qoeqpWKAiz7cXiKcSetJe+8Uxmej0sYcTPV0+EFHS156nAW4SSBSKG
	 tK3ypsEyr8HAs+UUOOqt1uqzvCSzsYtyCoF4mf92R7GtKctVMZYyKiWmiFhVlNoefl
	 44QnmNFzRrmYvlws4zGW1C2PSVhUHP9WHDxpMC8oXH1Vke18U2fjAVJS0X9gf0Zz2n
	 MYBQxbR1m3HJzV+lNm8rUb+hxPiVdRUgQvR5kK/gV/cG7oeTrzU9mVJdkW/gGK8P0t
	 0XeoIU8CcU5odKQefTKtrIf+/8H6FafrDus0eAdzpoVW5KqfAyiFQMalSgOb4QQCCy
	 MP2SXa/QOkofg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521181205.15130-1-alhouseenyousef@gmail.com>
References: <20260521181205.15130-1-alhouseenyousef@gmail.com>
Subject: Re: (subset) [PATCH] leds: uleds: return -EFAULT on copy_to_user()
 failure
Message-Id: <178058047176.4174549.2645359409149130123.b4-ty@b4>
Date: Thu, 04 Jun 2026 14:41:11 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 21 May 2026 20:12:05 +0200, Yousef Alhouseen wrote:
> uleds_read() copies the current brightness value to userspace but
> ignores copy_to_user() failures. It then clears the pending update and
> reports a successful full read even when no data was copied.
> 
> Return -EFAULT when the copy fails and leave the update pending so a
> later read can retry.
> 
> [...]

Applied, thanks!

[1/1] leds: uleds: return -EFAULT on copy_to_user() failure
      commit: ba8f07a62bbe3d481f104fc71c029373fa1ebc7e

--
Lee Jones [李琼斯]


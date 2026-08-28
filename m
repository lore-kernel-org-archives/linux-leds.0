Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A3F3E49DD;
	Fri, 28 Aug 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907398; cv=none; b=dKa+eNUh3PpF5FhVLYawGha2ejG10NgHO1Jd1pY3iOu3e411hpj+Yw/LEzF8tcG7+4iyOhhUbmZLuvayUmlCOehR4QPFKf4Q7PmVeab/JeCaYeiwlrLSqL+/TXK9xCnKNFfTrIkOD33k5pKO6hYao5NONJzlFpd9y59Eh/+jHEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907398; c=relaxed/simple;
	bh=PjAh0OOEXz+/Mxg8rl+11VqMeGNufoZrz2NBiBy739A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u31z6L3TKxdPDp2iFEGa6oVrnV4lVEUSP3HssgRL/uz/CetfVm73rMMAIc9qcry2XUcUWAkPCv9tehtueUXv/dRrJF36dLG5BiucA8OrNXpcySqQBo3cT3BTVO6DSThQQp6/t4+4dUm5wZhDblH2nZYbU2Se1LKHFbmTre742ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iw5Wdb+r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iw5Wdb+r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42C81F00A3A;
	Fri, 28 Aug 2026 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787907397;
	bh=lhPTHk+wjbHJC0T8LOMbqzlZfWpmbS57KG20Licsqdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Iw5Wdb+rEAxNXix54UZD/wS+inkMrjwfE+yLaduMpOwftLp5hVOcbfbrczjZMJlUn
	 +WNc48FYUbTU2xMXCQfZJ2NGB+X+dqVDb1mFSsejhYrAlnDhR6E5il2UJg51B+duIX
	 qWeiUm++QP0AfbCtyvJ9bXRZLZf/ILnlljvkhUMtIui6Op7Kv6PfcSnRTT2uITz1z2
	 7e6CDwoRe7enhbIpusexQgTeE7wX9MeA+8ugRu0HT68jPkcqEV44cydAOE46QwRj63
	 bfjduvEmPaxqPBwDbev4sgcZgNsbAzKRct/tLQVOoxcJ8ETyPuJwtW0QxVtCzSMvk4
	 PU2iZFillpqDg==
Message-ID: <6882b7d4-e0e6-4c83-8298-bc48abef5e76@kernel.org>
Date: Fri, 28 Aug 2026 10:56:31 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: max77705: fix fwnode reference leak in
 max77705_add_led()
To: Manush Prajwal <manushprajwal555@gmail.com>, cw00.choi@samsung.com,
 lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dsankouski@gmail.com, sakari.ailus@linux.intel.com
References: <6a914ad5.1e1ac41d.2a3f62.4979@mx.google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <6a914ad5.1e1ac41d.2a3f62.4979@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2026 10:46, Manush Prajwal wrote:
> In the RGB LED path of max77705_add_led(), the
> fwnode_for_each_child_node() loop over the subled child nodes
> returns directly on a max77705_parse_subled() failure without
> releasing the reference held on the current child, since
> fwnode_for_each_child_node() is not a scoped/cleanup-based
> iterator and expects the caller to drop the reference itself on
> any early exit from the loop body.
> 
> Call fwnode_handle_put() on the child fwnode before returning to
> fix the leak.
> 
> Fixes: 3b6eaa3db567 ("leds: Use fwnode_for_each_child_node() instead")
> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
> ---
>  drivers/leds/leds-max77705.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
> index 1e2054c..a5030c3 100644
> --- a/drivers/leds/leds-max77705.c
> +++ b/drivers/leds/leds-max77705.c
> @@ -193,8 +193,10 @@ static int max77705_add_led(struct device *dev, struct regmap *regmap, struct fw
> 
>  		fwnode_for_each_child_node(np, child) {

Would fwnode_for_each_child_node_scoped() work here?

>  			ret = max77705_parse_subled(dev, child, &info[i]);
> -			if (ret < 0)
> +			if (ret < 0) {
> +				fwnode_handle_put(child);
>  				return ret;
> +			}
> 
Best regards,
Krzysztof

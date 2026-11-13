Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568829;
	b=IHNNVYxnV/i6fFUQMA2BJwD/8grFOwkdtYvzn8Bdbvhfjk1HbmnwZqvEbf3d6aJ23b0Z
	 V02ixwtrMwZDsz/LsDc7QT5yJIZSgjvToqWqwwF0GUo0AFaXZRlHINYTnsf0uA/P6Mk4d
	 P5B8VloUeXwPy6rQ7s4STfq3X34ymRaLKp+orDr7YWr4MzFH6b8VqmlnJIHtmvvjubARR
	 0weEp4redPBw0M9S4uVO7bB+z3J7DuqS+3cQ46y6M3Ci/3gJv7jNFzvEpyBmL8XC+6WdA
	 Ffk6zWnnlOEjWI+CCySEbojevX8x2CrjOMtB8xadzu1AJ8GR7Pf6hCUal0L8oFKsWgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568829;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=Y4e6aFSVutfG4QLNpPw0xRoi42TqRhuOdJjePmvPsZg=;
	b=J7/gDYS+Cq8Sq8Pk1iVPS+BHyJAGob/W4B+s8lh/aboBNYirjktpniz9BHDw01KueRdj
	 RwCz2viSNkUEu6zffijGtid0WPPWVnNorYuz2MFWK/MQ49tnsB+Shtp/IGU5VYiB+IXc4
	 TMsB2t899vwdI8Ek6NodWWhyX3qZLemBGI3BN4V4BV33qto2VhTVS1azLdpbxcRxhc+AK
	 PvAoTGIbH5G48hRsCIuQ9noCFXoaWHwlorSL8HFMLnfScD1lPTwXP0WKKHbutBt68pKyQ
	 dya7ghbBzq7eTnJNm5JVwYrUhxBanJhn9vpg7l7k94ya+hS/qywIztJZwb5oQO+42+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XBJEJQy+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1F7606A336;
	Fri, 13 Nov 2026 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XBJEJQy+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63231F000C4;
	Fri, 13 Nov 2026 11:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568829;
	bh=Y4e6aFSVutfG4QLNpPw0xRoi42TqRhuOdJjePmvPsZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XBJEJQy+iCJQHKbERuzXpDGdKh0s+x9ZCAll5ofyUGlRp3UzcODpC+8vRiT1qvEl1
	 UvU2LIrJSVbqKQvx2f5h4xADRR/XxPHu1Wy8zF/dGlM/6dslT3JHO+Qc0EH0bng+F3
	 zalbnDMElY44Vi9Oqcp62Jad8KeEVYbgQWXeO0Z/fMd/Kjz4plvb5LTbWGqcU+T0K6
	 UVGumqYXdOTl92obMp3cI/o00LAlUmYZITHyXHMVmQbeHKQFy4wE7Htl/QPLQ27mU/
	 d+niHvWkMD1pj3Lg6NQTvBYMya0NDeKa2yqlbIOcEtP8H73wKun6uqPPkB1YMoQkok
	 UkbcJpYPQ6POA==
Date: Fri, 13 Nov 2026 11:20:25 +0000
From: Lee Jones <lee@kernel.org>
To: phucduc.bui@gmail.com
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/2] leds: lm3532: Avoid duplicate error messages
Message-ID: <179310028165.2808517.17162796989592435922@kernel.org>
References: <20261021045832.16356-1-phucduc.bui@gmail.com>
 <20261021045832.16356-2-phucduc.bui@gmail.com>
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
In-Reply-To: <20261021045832.16356-2-phucduc.bui@gmail.com>
X-AI-Review-Draft: <20261021045832.16356-2-phucduc.bui@gmail.com>

On Wed, 21 Oct 2026, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Most error paths in lm3532_parse_node() already log errors. Remove
> the redundant error message from lm3532_probe() to avoid duplicate
> logs.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>
> Link v1 : 
> https://lore.kernel.org/all/20261007104915.507801-1-phucduc.bui@gmail.com/
> Link v2 : 
> https://lore.kernel.org/all/20261009091059.25729-1-phucduc.bui@gmail.com/
>
> Changes in v3:
>  - Remove the error message for devm_add_action() failures.
>
>  drivers/leds/leds-lm3532.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index a3bc9680dc4c..a050e4350bdb 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -708,10 +708,8 @@ static int lm3532_probe(struct i2c_client *client)
>  	i2c_set_clientdata(client, drvdata);
>
>  	ret = lm3532_parse_node(drvdata);
> -	if (ret) {
> -		dev_err(&client->dev, "Failed to parse node\n");
> +	if (ret)
>  		return ret;
> -	}
>
>  	return ret;

As requested on v2, just:

    return lm3532_parse_node(drvdata);

>  }
> -- 
> 2.43.0
>
>

-- 
Lee Jones

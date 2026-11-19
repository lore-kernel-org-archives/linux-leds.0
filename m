Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.208.23.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075833;
	b=W24vO+cQXWG3F2pkIpXKqbsoxpJDdFgT8wQ31E59KcUuZqwn1PGvPLTzcmWM3x2OpAfP
	 QlgPYmZ58flVisQs+eDEhKUtuIC0jz2Nnmhf9vTF4DY3vPttL90IHW3R4+TywfjvgaD2B
	 QT6VBWCbg/JRBQZ/TceOAE+FaFBIwpjNLXyiFKD7ktC1Z0BXDd57NqUCnNo2bYcubewC+
	 XR9wBsiMUd/hSaKveEilMjtEJTKkx5oHcI2MmhZHfsCqjyawiDGdW9rCJtT6N9kawy9af
	 +PswTYVSbQHDDxB1mgZzNpb2ed0oy7UNyEAcrebRjBLPFck+sj68dULDSkQ7QjM45ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075833;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hLIgpPpNifxroAGHqKnhuHsCnWDYPBM6z877fYZHXYQ=;
	b=Gc6ea6f7ksxuoouwl5pQMTBaHaYy3t4iV/c3JbaGEa1+wFkgU87SDvxJIfaAGBAFJlfr
	 hsCUjZ6snej6mqQvQVXHW/gaEWflJyY23QbTmgF3x4M3uqyuMdoDZNQZMeGxJaPR2PYXl
	 3E5zRItFIkgMMUUdwpxl7pQQas0hXjnr1ng9I9CFKZBY5la5hUjgSrCP/RB7G88B8axpT
	 jOpWzQH95BHMbfw1RWmF4oH5ocEd6Qxr1qdXIeWyjRM0Cbv1QzB8KkFQgNuMZFxo6lmZb
	 vaZfqImcJW/4rTi1MF3owrZlOqrRw2yWWo++4w8OR5Y5I/yrq8mCLAsaUdXluv6TQBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=emfend.at;
	spf=fail smtp.mailfrom=emfend.at;
	arc=none smtp.remote-ip=194.208.23.37
Received: from rmisp-mx-out2.tele.net (rmisp-mx-out2.tele.net [194.208.23.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E550B606A320;
	Thu, 19 Nov 2026 08:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E550B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-226-106.tele.net [194.208.226.106])
	by rmisp-mx-out2.tele.net (Postfix) with ESMTPA id 8D1AF154803;
	Thu, 19 Nov 2026 09:10:25 +0100 (CET)
Message-ID: <bd02afca-4136-4639-b6c3-40765cdada73@emfend.at>
Date: Thu, 19 Nov 2026 09:10:25 +0100
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: tps6131x: clear torch brightness cache on flash
 takeover
To: jiegu <jie.gu@leica-geosystems.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 gujie <jie.gu@leica-geosystems.com.cn>
References: <20261117064328.4096518-1-jie.gu@leica-geosystems.com>
 <20261117064328.4096518-3-jie.gu@leica-geosystems.com>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20261117064328.4096518-3-jie.gu@leica-geosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jie,

Am 17.11.2026 um 07:43 schrieb jiegu:
> From: gujie <jie.gu@leica-geosystems.com.cn>
> 
> When the device switches from torch mode to flash or external strobe
> mode, the hardware torch output is disabled, but the LED class
> brightness cache may still keep the previous non-zero torch value.
> 
> This leaves sysfs brightness reporting an enabled torch state even
> though the light is already off.
> 
> Update the cached LED brightness to LED_OFF when flash control takes
> over so userspace state matches the actual hardware state.
> 
> Signed-off-by: gujie <jie.gu@leica-geosystems.com.cn>
> ---
>   drivers/leds/flash/leds-tps6131x.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
> index 823e0462939c..4f708cf56178 100644
> --- a/drivers/leds/flash/leds-tps6131x.c
> +++ b/drivers/leds/flash/leds-tps6131x.c
> @@ -294,6 +294,11 @@ static int tps6131x_set_mode(struct tps6131x *tps6131x, enum tps6131x_mode mode,
>   				       NULL, false, force);
>   }
>   
> +static void tps6131x_sync_torch_brightness_off(struct tps6131x *tps6131x)
> +{
> +	tps6131x->fled_cdev.led_cdev.brightness = LED_OFF;
> +}

Nit: I don't think that we need a helper for this one-liner. But also 
okay for me.

Tested with i.MX8MP-EVK and TPS61310EVM.

Reviewed-by: Matthias Fend <matthias.fend@emfend.at>
Tested-by: Matthias Fend <matthias.fend@emfend.at>

Best regards
  ~Matthias



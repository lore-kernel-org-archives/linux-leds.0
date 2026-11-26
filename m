Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795696115;
	b=a1fD2VPEeY6iQe76ys2EXe02kXQM+HeLEEx6/5KZx+RAJYEXwB721ZoBRRwD3zxT5rWd
	 OdoXcdpTV4awyEbC8y8ffPoY/VEQhsxzKDkzTnKRbvcZzoDmz3eWj0WY1aVZkuOhZGRm+
	 v+P/hJyZqhN94EiTC/ravntf/I/OtquSPZ+nAfJupMqv6cjn4yXFbXQE45B1W6tdKCYD8
	 h8PVxhz6I+ADBsCojQC6Y1Ws7wbrgBZWtPOvHh3a2iqBBMY/lwCckTZayXDVtz5d2lcjo
	 TXUbvhK3HuvTe8I36RapFAn56Q+8CG3VGUOoEvIfVk0B8nhCbV+uMZJNc6ZpHBvuOHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=HRNrmfwaZcbb9652X0mDxC/CFD1bcMYKtscKgrkdekA=;
	b=lfbfvsbZW1eP4rGq6UiMXhNA+yStM6vBeAMD7nhy/Mysfele13n3wi799LPups5DyUt/
	 RXoXYHjXRXPE1sN9GTcQcbEbq+InlDvIvoReohMQMnqheEnoDoLXEquhzKzm9gCDrXLYP
	 XmD/eZhUFZs63eK7qov2Htle7Y4tRYg8J3Jn0C12O2dkXskJ3nmS1KltSBWNCcV3crxGm
	 Vn2zbQvIIpXzP5zE+Za5iLuTiQP3GGiS4ry9a00cRv5NJcqqt5YPawO0+SSLgm0fDJTTc
	 tRdQdNzcBi+ryQ73zgCEDjM8rFebZ17CvqWl3QWhAHpCEeAhlvE0pEi+aW2dFy+ZauQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tAhFjL30;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF88B606A31C
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 12:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF88B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tAhFjL30
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4cd576f2aso51348697b3.0
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 04:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795696114; cv=none;
        d=google.com; s=arc-20260327;
        b=JuW+/jIUjoASnkVin/diaz508RfwUyTGfV7xdMy085Ipd4pJXtitb7rcSyuGw+Dgzt
         8yM4hmZabGmChZWfHZnGv7C52B5zE0s3hsG4qKiNZy+n0Od3xpEc1gr+IAsfmJXP84dy
         qznMzOBvVriBJJYff+fvZui5Hb8fgq+HaURTMKmqAnKV0F9lcCCKTt+W7kSQ4w966Z6K
         Z7IbAWbpqXy7TXowayW1uM34RJBVx3m4cfEOEVmOHRU37LCXt/QcackMwu0OJg5zlJNO
         2cdopkIBuyqvmDcKEAjMFRfwPyDb/FEYpCShALyHeRIMk/QgpUN31C9WF4lFbFMNtnVQ
         Yi4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HRNrmfwaZcbb9652X0mDxC/CFD1bcMYKtscKgrkdekA=;
        fh=7b+qE9uSDAGGZzOd+TOC6LX8f+Q8RbnoulGhcEV7tPY=;
        b=EdFoQO22aXjILUkNB3+NmM0IfnkG1gsyT/NTF0Sk842fWesniXLvhl354SSKBRWcLV
         qSZVOh9NFYP51A4U3d4HL8l0/XMD/abdYFzAR80ukACP4wLvhOK0UJGgifcDayYID8Qe
         C+jyw2/QNfHqEGFPRJRLLApjTxr+O683uOC9JZ92bSut9eHYhUmOVurqb/4tMiBblhlS
         ex3VL7FrdfAiH0kixx6Qdoz8dYXp3lbrMd3n2GGLgZSiI1LMoHL2Ok5lBGnjwiCKSuM1
         Ty6GCCeEAZrrVYwxNpbGqtnwc8tyrPbk08toZ5riNgejqvYbGQr8suytQLavKiQQ1avn
         AGAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795696114; x=1796300914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HRNrmfwaZcbb9652X0mDxC/CFD1bcMYKtscKgrkdekA=;
        b=tAhFjL30GDJIDzIHHmNiU645YBrP8AqWztEhqhPKnl2VjAxq3nEo9lVWhKlitchCXe
         xznSytZsXszLNCygekSEiTAoCyORxijYAK6lKhl29oeaqrdXlkYfECa8/O9u4opjKx9O
         A94cSfSH6I/Fy1esmuGrC7LDW73+5wQcq6p0cNogEIpnIIlD7S4RF9yzhPzxdw1LcD5+
         aepG/StcDsxGZilFUwm3a+v7WT9VMO8NyE8fFeyMAS6iPeSq9pUGdZzgF9IY4JRLA1kM
         KwmE9ZS6QalqoNxFS9LPkKFqw/kgwn/ErauwPXR8Dn4M+xkaMvAGvVylF8m74l+Zh5sc
         D5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696114; x=1796300914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRNrmfwaZcbb9652X0mDxC/CFD1bcMYKtscKgrkdekA=;
        b=zDbn4B2G8K/W24xmgqPbyWd1ihFy/uifuuC3GGJng2jQdAWEtFhr8xtqwBT1eSLgs7
         CnM248Z0J4Yxp7VkEfF5y2mgdIU60ouysl/picWrAm1E0bbdUyWAuCTAxuIFb0umci+E
         k9cEhLVIemkulgnuE9r10Bb3nLYG9oubbzKZaLHB7SZ5GKCVgU1alKMVXADrCW3k8t1X
         Hm645gsaObJNPbdj3hqFVgrlpS+siWoigwqjopkjK2ZiQB/uMFVD4GyvyJ1bZiE2GrZ/
         LmDoqKIcRUBuFv0J63EVkkComtatReKCvvN+JPdJgPB59dEKhqqbv2PWHpL6eEY3b1tT
         yo1w==
X-Gm-Message-State: APuU4Z8lDGPwU2QnuDA9SkTqGDdOZ5COx066tACOh2AYIp0Jpe6kKGB/
	yc/Pg3fkAJIt59Eckm0sot7kZEQsRPAuHMfVeHfMFq8KFcahvdVRksdOvfntP33qgtaiinCC5Fy
	xfykYCVutA62cNMuD3ukBLBRYcImaxYE=
X-Gm-Gg: AZFdTZd/3s1eC6Z/vzffANtYWKrL2oPQQ1KOOynilA908JL7Rki30NwvT/nlWBd8YD4
	lQ1NTy519snGYdGX4MubUs3bR55CXU3tWMSNfw+r2oRyMUkPznxRo7S5HiQJr+05uORgo+nxzu0
	4synil6dN4IzNsOD7+MI6TNa6DCEp9bWGhUI9kQagFtNObNFp8IGcoZk4wou5U35w+3AgOv9Xnz
	DROhczgUqBVBjdPlK6lsu8buft6ALURQyr71Ed6s9tiMNyTpYv0YeL0z3kkTlLHpY2tdPTAqewj
	Ld/T4HysyNGq2tVMEWPGo/gNw0ip+qJus+kvwUMqW2Tghan87RV1I4tBSG1+Z4D7xjxnNpR2D2R
	4qJFqiJqVddVFoyQ4cmg+Cuv5uZ5yiq2Bw1R5RibbPM4qFW7rUcsZ1kcLDn9edms2/QkFaQ==
X-Received: by 2002:a05:690c:63c6:b0:8b4:cc9d:967d with SMTP id
 00721157ae682-8b520513e7fmr87097987b3.59.1795696113717; Thu, 26 Nov 2026
 04:28:33 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125134013.2692510-1-congnt264@gmail.com> <366470ae-41ae-4e3f-9170-8b2f67cfe7fe@web.de>
In-Reply-To: <366470ae-41ae-4e3f-9170-8b2f67cfe7fe@web.de>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 26 Nov 2026 19:28:22 +0700
X-Gm-Features: Aa3M54pSZyA2SwxCMS98XKa8ac1EnDdRti9OZ4BvwqNoh_Gw5p_qcstm_-_CdkE
Message-ID: <CAJpJ=GsNZnyqg0FBVB9jhNDY=2H=DMt5g+4pYJ1WYvFjp30spA@mail.gmail.com>
Subject: Re: [PATCH] leds: sgm3140: Put the child node reference on success
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Luca Weiss <luca@lucaweiss.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:15=E2=80=AFPM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> =E2=80=A6
> > Put the reference before returning success.
>
> Please avoid a bit of duplicate source.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?h=3Dv7.4-rc4#n526
>
Hi Markus,

Agreed on the duplicate, v2 drops it and uses the common exit:
https://lore.kernel.org/r/20261126122516.1198461-1-congnt264@gmail.com

>
> How do you think about to apply the attribute =E2=80=9C__free(fwnode_hand=
le_put)=E2=80=9D
> also in the implementation of the function =E2=80=9Csgm3140_probe=E2=80=
=9D?
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/property.h=
#L229
> https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/leds/flash/leds-=
sgm3140.c#L185-L281

I kept fwnode_handle_put() rather than __free(fwnode_handle) because
this has a Fixes tag and may be backported, and the __free() helper
only exists since v6.10.

Thanks,
Cong

>
> Regards,
> Markus

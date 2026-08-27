Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF3190473
	for <linux-leds@vger.kernel.org>; Thu, 27 Aug 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842951; cv=none; b=IvIR9biSniWiFjEeEFTonNNuhRM+l0c1Y3xddOjXbUO2oj5UMcgEx3KLuHLLfzS02pKa++7Sscq41wnap9wg+6NcRwxQSxrTQWWHf45813Gnz1y9zUnHbaQllyyQkA0pOD4rDiwu1Gn6UxP8FvcmM0ru7VjA8OL+pYgM3oyrzzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842951; c=relaxed/simple;
	bh=ObIQRn/vjtcvL4sdmG6ZiBqkBLodyvFTNyqP+glWGbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2yyI8O8cz7WZI3QoHWCb0PsZNNJp0x6uCmJg8yfGCuCtnt2ImN3WVbDg0vsCsoRQlqwvwfOlDd6bKWEEjJ3naF5ptQAZl7oRjndNBzn5hTJhq1oLq2fzxyi5wTQYbfEceqSXA1N/IS2qHgkqTUOxhy2eZ/nmAxitqowd5BAchQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XczkvyRJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TE5TEgrd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XczkvyRJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TE5TEgrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787842949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PUTGt/6T2857LdQnAot7vE7NZU52FC/fuVGXZNjR5lw=;
	b=XczkvyRJjz5q6KhSGPsiV0PZ3uZdlDIP6ToTx8JB7xqbw73HU71Y1j4FMggH5r49vvZpsI
	EilMDR2IhU6NMcYowZItZIaAF2gLOZ1t2DYNdbHRErr+S4V7g4e89WzsuF8ilKsBgzR/bI
	kt010V96ccjtzX8t9tksQViW3Yx1lRI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-S5LVPZmfMS-LZj9VbHlH9w-1; Thu, 27 Aug 2026 11:02:26 -0400
X-MC-Unique: S5LVPZmfMS-LZj9VbHlH9w-1
X-Mimecast-MFC-AGG-ID: S5LVPZmfMS-LZj9VbHlH9w_1787842946
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-820111eb28aso40443807b3.1
        for <linux-leds@vger.kernel.org>; Thu, 27 Aug 2026 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787842946; x=1788447746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUTGt/6T2857LdQnAot7vE7NZU52FC/fuVGXZNjR5lw=;
        b=TE5TEgrdQXhC6HFlhBLTeAJ9jenuMY3OxtZSirL6KNM53pZY8MoWJ1eba1kQkWefaO
         DdTD+Y6shJsW7j3S4UfqRMIC8hMvHo9MUEKUlkVOQTv/s9cqW7q1hJgUSoM7PluQRiRr
         GbeN63g6DJ+WWJT5wKCw5wcXSfvZwWL3ChCIS8RXnX3kycPevynLf2D1vSyAHqzT7zLs
         7jidKwfhdoo6yRaxTg3s9xg+HO07rLoc8Ku2n+TXMsCk8s9bhzrr4zCbfR2h4zFcjzqV
         hnrQ/awh+BUVVIEd67iZdXx553Y3tYlHcEZ3UB0/fAYPEKXhfPLIRxhUDXlzsdi1bWZP
         C+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842946; x=1788447746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUTGt/6T2857LdQnAot7vE7NZU52FC/fuVGXZNjR5lw=;
        b=tEkx2MXB5eGaYAfgGb6wAbRGoxlKWA9JR1WQyc+8oAHw+ZY13uRcC29pJI0DIXDnO2
         I0qzOW+ERbDNxXm+poIbxG2wP0ckkuIXj4kFcb0ly1dVPZSWwrKyTstWkVDhMWjyMnWD
         SNdwm0bf45VPQtMX936tY+uydrjMDHkGMn/wjCMolwvS+YzYaCe06kkuDp1xjBK+nLCP
         iBGbwkoAAIyBWuXHwl7ztSwvxyB79xKLsIRn1vdgLOTNK1HXxo2sLo5ajaBzKD/qrTmf
         +u93pVB206l6yo3kCqNVl1iNcWW02ruUC882m0rQtdbkORx97EOy+BgTlfUBJV2iHoVS
         SJ9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro9ush2i7CiAqZCh7XFPF0hMIEPiYl5I9jDlX+pVy3pnwTaUL2ih7VkxajUr2Te30lpW11E92qGduET@vger.kernel.org
X-Gm-Message-State: AFuF++nVUmWPPiRgSu/dFyEtLQFZVLXcpOoiwUHLYOxT1iGz/UeGHBYG
	JANfO+HThCc0M70/wnlVHcmfLex82VeshXWztg/C0pCIJNLR9Q/HIYAajhvkEG1HtpXSO990Wl2
	nNlyWTjy+v5/1LCmVTJKfe7UwAmIXXDIaqxFERqLaidUJB27swrnzS0IL2NhV8Mc=
X-Gm-Gg: AR+sD12qqryBk/+UGAggC/CL4TqYjMrQ3RBQqIXBZ53vKK4UgbI9F+4k3AMnZTQ/die
	7N65c7LYkgrgnywOEBAsj4mfJeyJ+m9LviM9icqmgKMeWa/CcL8ofnOephJpcSvinTbeKJZxXM8
	N8fUbSRKt+Oi15m0Cn77yBE2RXFypXJp8j22JB+e8wB6CtTcsida05wNCMeYYCyjhNKoN7wpia4
	witqva00WKv4qf0XFl/DWWe4uYPlzW7lTuME4OZhySGF77Wiughp/YAdfDmWWEk9vuaM4dwDzrc
	VFtUx9dUJJkLKZmJwC0QJ78+bdPApjn1xmH5ZEF0HzlKOEAu7L7O0D05CwLKo6vSha9KsmKt5Yn
	yz7LPbV95BdFSZWIO3REBTOWxRyt7nY7JlB+lYxLZJWsqnJg1etY=
X-Received: by 2002:a05:690c:6f04:b0:845:ddf4:a399 with SMTP id 00721157ae682-8573eb29e82mr76831687b3.11.1787842944140;
        Thu, 27 Aug 2026 08:02:24 -0700 (PDT)
X-Received: by 2002:a05:690c:6f04:b0:845:ddf4:a399 with SMTP id 00721157ae682-8573eb29e82mr76828737b3.11.1787842942569;
        Thu, 27 Aug 2026 08:02:22 -0700 (PDT)
Received: from ?IPV6:2603:6081:6e06:8bdb:3863:7a4e:feca:4412? ([2603:6081:6e06:8bdb:3863:7a4e:feca:4412])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85b5bc331c5sm11402857b3.3.2026.08.27.08.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 08:02:21 -0700 (PDT)
Message-ID: <bd7734b4-b68e-4fa5-b6bf-433332c5c9c5@redhat.com>
Date: Thu, 27 Aug 2026 11:02:20 -0400
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: gpio: Clear error pointers for skipped LEDs
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260710150841.19669-1-sdunnaga@redhat.com>
 <20260724180412.43150-1-sdunnaga@redhat.com>
 <20260813154559.2407-1-sdunnaga@redhat.com>
 <20260827143631.GD2943942@google.com>
Content-Language: en-US
From: Steve Dunnagan <sdunnaga@redhat.com>
In-Reply-To: <20260827143631.GD2943942@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for the noise, I missed the applied message.

Thanks for applying it.

Steve

On 8/27/26 10:36 AM, Lee Jones wrote:
> On Thu, 13 Aug 2026, Steve Dunnagan wrote:
>
>> Hi Lee, Pavel,
>>
>> Just checking whether anything else is needed for this v2.
>>
>> Linus Walleij replied with:
>>
>>    Reviewed-by: Linus Walleij <linusw@kernel.org>
> I'm not sure what you're asking:
>
> https://lore.kernel.org/r/178602432127.2934315.922699465700010447.b4-ty@b4
>


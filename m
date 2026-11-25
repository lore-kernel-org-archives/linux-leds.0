Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619726;
	b=4thww0iOlrtbt7jCrjBxs60V3WfPksti23IjXdObWNeGnuspu17RPaTwv4QO4CgROJxo
	 UyJy9xpIbL57x+jvW9kvwMSdxfN8EizNifITrqJgQxiVxZsJ7lOOvcx0b6OjeA5uqDBJv
	 AZTplGCWIG1HJbA1IW3i9lG16NACUzivPGGme48j9cyTLYZ4DGZJhDwFyEMx3Go+p+ZRj
	 AgmVi6j4PB+msRhobQPEeV/V7PCGqGO32UlwujpqVqEfmO1V62ihxq7Lm4eR0Cp1OM0Xm
	 70FrUGU9Lb2ZJu5JbFpPF+bY9BciXcGiIU7sxoY80PIOb7QlDdHHlZoV3FnscHfo/mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619726;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Subject:Content-Language:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=y8j7aXDev46rOLRUgp/4Ho2/hVfzUJxZimVf/AzcDtg=;
	b=JO9DKzKl9yYEF7gpMn59HKUkKEuyrFjQAKyMgJwCZZzAqfMzIyzGbPPkvKHJ2bBG6/OB
	 lCdJwEgJe3xidjcU+hiVPhMt+NE87Q7jn0PpmpLhaSMK8fA9pcQWSS8kzMqKLXr0Ks7wm
	 EdlqM4IiNlxgCv2saYvnSo5czSTeyYWRmYW417Cee4uvN13qLniqZdpQKr5BRFOvkwutF
	 bCiIF2HrqK+JNiWvdoqrqIMohexbyY8VmnhmnG4URZWY6lBVKayAiABlxU6um2D/W/3uX
	 qqPyOzEn/UCIdYC7LLfC9sDg4ttfA60EAtZTJM3OUddboaT1gtGahtDEetssmUdRuTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qa7Yk19Z;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07792606A32E
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 15:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07792606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qa7Yk19Z
DKIM2-Signature:  i=1; m=1; t=1795619724;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=web.de;
 s=s29768273:rsa-sha256:jqYhEe2VlTz7/CnhFAC6/8ZCFS7A
   WsJSZVWswM4Foj5JPtIYnvM6sjQyJpW7qe4nV+PesZzcGrvPHGj5SBjDYk1vs5Vv7WfiwqkQ+t+
   cPgrOCZVnyUg9kYi39JEXrE0wQLlKNRq5ybi1Q57UxVnI/yLFpg0z8GAzNbl18bboL9idIKk3Uz
   3dMkyacJqN3Tjci/jgQz3U8tRwKFQ9QIyuEIaBvRM26ajh1s4z8BrRqvyfx/B5dYW0GnI1evSMI
   EeXg7V5FWAYg6FdLLvEj3YO3zMExOsdQkbg4GchWvL+ufOnFeBY0q4oWrG12AZGEFGuwP9qgQOC
   ZtKiVIS4y8c1jw==;
Message-Instance:  m=1;
 h=sha256:
   QLGNTxKHL1jRcTK9DxSYCyQ/va0XLqYDEUB4r2OIpWY=:
   y8j7aXDev46rOLRUgp/4Ho2/hVfzUJxZimVf/AzcDtg=,
  sha512:
   Fe4O/V9Z/6L6pEdPChEMiz9NuTstXjZl/F1GLG7aSWbzbydceRVoHyIxvVM2NNKYYWdgDI3x4Ohu3ts5uSorHw==:
   MiKwUWFRKlXBKQx+IrHAUtkSHmyiaK/PVxa1E70K1+12QeIe2tvY+MHiAa39qbRVSTTo1kfYYu/ZIdgEiSRH0w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795619720; x=1796224520; i=markus.elfring@web.de;
	bh=y8j7aXDev46rOLRUgp/4Ho2/hVfzUJxZimVf/AzcDtg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:References:
	 Subject:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qa7Yk19ZO5VrHZTKgj3tePgELl0uByZLt0v0P9vOM6Bsstz1+Vi5+rEvocr4VlMe
	 UjW5erSh9vZEwCW28Z9VGGu6jsJox3HEkkA/5Cv3JB0WsmHfAkPzTt/3B4q9JOu8j
	 PIJmp0XojfoGJxu0PxSujV+rDeBYF83KMJVZovG92ZB4LEyM3YNwKK6deE1b8YaHw
	 ffsP3U2dDEeINXOM3xw5K6xtw8wGtZBNdeNkBJPJq0dqYoidwUCM1EAkZ1pqwQvAb
	 69g7900QAzf+ZwTFQYSOCMF4SQK0xgi2TkVb18mhnn01Be3dDPrPSgqeL19L7/vRz
	 WjeJwbYxhmlddoFhMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnG2Q-1yCxvo18Im-00nV8g; Wed, 25
 Nov 2026 16:15:20 +0100
Message-ID: <366470ae-41ae-4e3f-9170-8b2f67cfe7fe@web.de>
Date: Wed, 25 Nov 2026 16:15:18 +0100
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
To: Cong Nguyen <congnt264@gmail.com>, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
References: <20261125134013.2692510-1-congnt264@gmail.com>
Subject: Re: [PATCH] leds: sgm3140: Put the child node reference on success
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20261125134013.2692510-1-congnt264@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JM8AuLr4co4Q8o1ZLZFkqcCpMjQ5sHnGfbO2QVguGsO2hfWItlK
 up5GK2WMZub1ppMsSVF1N1GiuGHoUetq1pobrkcsJeBqKtHEuaoB9avy70D4g4rX6/cHSIi
 tUdrsSSFjHzLsp/M4KHRx52I8lAach9P+SHvjcZjLRbLKCyKtmc6gPIFNhd00+nzsRvEck7
 xbS5IaLhHLAJoIzj+JAYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9PZc+tpHEhE=;2B7+Xu5HKegz+yJU1P86DWwdUeB
 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

=E2=80=A6
> Put the reference before returning success.

Please avoid a bit of duplicate source.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv7.4-rc4#n526


How do you think about to apply the attribute =E2=80=9C__free(fwnode_handl=
e_put)=E2=80=9D
also in the implementation of the function =E2=80=9Csgm3140_probe=E2=80=9D=
?
https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/property.h#=
L229
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/leds/flash/leds-s=
gm3140.c#L185-L281

Regards,
Markus

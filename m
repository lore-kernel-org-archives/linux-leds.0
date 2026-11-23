Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444320;
	b=1J5f4/x+R+FrKEzW6xIAs9AbJsVuCyRBkMIT/j1j/Hxee0XZFCVzHsMer6oYNumstpzV
	 pMMIlW2c0C4QRi0xLST2vikBlOaJjHsvGoA0jTYu8Qmx7CiMrJ7N9nm/mTvw1tEpYBgbg
	 Izb9TLn4/zcRJGAyXG3Y8Og8HY+A3i51v6wXfXpiY3r+Uztkl5Yi9cDB3tY0cbAKD+Kzb
	 6DhjmacV/Nq0Ir2DXBFgZz8yYuTWGxPcZE2g8UK6nT79dWghLn6dScbiTkjeG718DnoeB
	 FxzWuScrjmWvdLywWzNNZf25+FRZVStwDeHzxrkaiQ3eW0hbC+yzXTRn3zes6SZbyag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444320;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=3aJ2WxA8jh4RxwYEHwBXqWo8xD2DNp/kebAnomZYj58=;
	b=HLDV8kIzaalFskEpf0+2hi4Vghlw/LRTAmWU+c8KaFDy7D9XtCSyq+uY9uZeX7gPwr41
	 TBIMf3rVOAUzPL+YB5/NKKC5HTEH2O1+clMi7Bdyec8259AwOmpusovLmvaEeCPzG5NIY
	 /EL/UWrMsT9j2ek6Qj8WsKLSahwxADT0xQnaSuC0A/qJVz0hIhgqZ6Et2USxlF+p2TKZk
	 ffbTWYpXvmdSJYcsH6fLdCGY+g4fjz/Af7gbYBpWzZG/WBcawkr6s12F3PUovRyXn9Uof
	 qzTZvrxQeiDFK3YRsbPQ5pp/H+bvXi/SwoGBXkX1rXxQsRmks575wvMonewGAqFuz4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ST5z6jde;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="Yt/Ed2tI";
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF5606A31E
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 14:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98DF5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ST5z6jde;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Yt/Ed2tI
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B592D14003BC
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 09:31:58 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 09:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795444313;
	 x=1795530713; bh=3aJ2WxA8jh4RxwYEHwBXqWo8xD2DNp/kebAnomZYj58=; b=
	ST5z6jdeak6z/EK0/SOUcGHs3i92NuRlxsC47wPqFx+SwVKhkhWykfjD/iLmRC4K
	LrfviMWaZUR9yQoEH5on9M8+dqgeuIsmaZQF66DG64a1uPkFb9XqtfZ3n46m3pAA
	2LsG9Jst4W8oWvVKCGuAUBr4TWovOufkhybi+JeCBRIe9UKcjMmTKEJw4C8a32yO
	lopP89LDLbFfsmtAghmBY6f/T/VRQSd8C0gvxdWGs9L9oHaYtDBjDTk0WHDDKWJs
	iIokkotmC4ra18AI3JGDksr2+QbwRHOU88rdB8CdiKxhd8H3QKnK0XFbmzekNpKw
	UaiNR7+gWpQ/7y+4lFQ1dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795444313; x=
	1795530713; bh=3aJ2WxA8jh4RxwYEHwBXqWo8xD2DNp/kebAnomZYj58=; b=Y
	t/Ed2tImUcelEISsIuYx38roYgkCaLYrEFVGXM+ELy5psYrrcQVB19DAP6LxpiEs
	viZiujLz09rzOwiKWnucyI2aXMyWep4GhO6TF8FHAJPke3ZITiswlsVsqddegKMy
	9BB2ZjHmhHW++e/0jWvHyPFPVRy+Udc7S/BVC8W9HX4Y3eqG6KoyYqxr4l+D2g5G
	i78bg5cB2Fwmx/eHK3Cndb8cxTCfEV8VZD+2axyQVxa4sxjQzwhWht3BIYw6PLNi
	ytOV305oK6SGydair8AAD2d/gjaNienGtpZrFuh7lZPw7qeuJitG95/6Lq6LSDj2
	FiGwNUOhI99F1iCpzGeMg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795444313; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:kdXbEB4fNuNxtswP1JsVv1BwgniI3F3sa81B6vv4ZR4j/DK
	OrR2I912ipKIH8ysnHLHTd5mgRNANe0g19WRA2Y9cySiRcQjN7piuA2T56QUBjKu
	/NTrg1lfYaZ/gq6EXk2FKJNDNYE62kMU+CKTqGkVvvxEJ4f5ayo6yk9rFlzk2tcY
	9H55wZDrrYSY7UEV0180cAUpC1+iBIwibhdL+torbZR8ECPGr5f3UubgbLQ23fmG
	pPLSZx6ZrS1FDVvuLvUx1a0mK8s+Q5UqsHoOVFp5RmA8YmFmqVzQuQmbQPTsRMR9
	nfjwJR8Dqi0YMvk4AH5n6nN6HJjlTz1DqIDBSGQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:MJdHtbIH2A+R1Jb71Tzq2a8hopT1FWQO1fjXAFbq/Pk=:2zeJSwUnb4LKEaN1eEgNXUm5/zAB221ydnHGNFi1WxM=;
X-ME-Sender: <xms:VU4Eaysu8B9hlFjCV4E9nYXL0zO8ce52vT0OdZ8dcRnzuSgH9IucNQ>
    <xme:VU4EayQe8RfTM5LROu9Pz6pb3lw42Z4aDA9sAMBMewNcI6AOnXyuq55CLZhv1tnfe
    eIR5W3tsTlqt3wWGzfnwwULS08X-h3GfU2zgWq2EWMpLulcLj0Q-7o3>
X-ME-Proxy-Cause: dmFkZTFH2ouQDqR3X+IG0eO6K/1a9wLBHvzj7UuSgjFK65fbDHV5Sippt0Li9nfYKwHmYn
    /40ZYHzme+8Zva+P2dzsuKRqfOELBlWfgmnFF4/VyTashoOpDBfx2s37X0VUOZXgP0GqE8
    rIuoqoQ3jN4pUV9EulP0xzW4HLsSiRR8HCgUasw7kivmjEgNoGzSmig3wCc2QsJcys9jcx
    HmBJNMecNTjez41LfvpvntwmsF2dQbwcCzNnERjAmwXm9V+5GyZrjYuIRpOMVFT6MDoGAw
    Ood5iwhw2SBCZxDlCVJAP6nzve+7UvoNjfOIzwJI0qtFhMMZGEp540AFN+uhIq4hw75aix
    XhdGCmDd100u64/W3sJhS4EUtLgAPxOw6lvziyG64qmvs+aVubos8q56u127nkJidPwNkx
    8ApMvb/J6Cpf8zdSvYkjOcik6wC7nRJKYqf4hBbyUfwzvXjfBxhtTeUWPG/YMQG56oCCdL
    5vSM/HOzVYH09TIKETOIJcM9zOvgMGA/8JviOqNqCqThPJkRiIHEMmThWDbTkbBxuYzX+/
    ggQo7fTAZMCEZHR4LI89tSXiKWQuTfaLQ5cmlhE3hso3gTksgO1554OMi9elU5IniTovyN
    OjEQd2YKktSK9eBD2AuZ9JbpNdHQsDvz1Dgv1xVd0tCPCKnk3LoPjm84cvhg
X-ME-Proxy: <xmx:V04Ea2RoeifjrdayPXfNPJcqkzqzgHX1WgRjG_a9YrZYz7kSd7stuQ>
    <xmx:V04Ea3od_bMsr40lFXluKV0Mncy79SuHJy0WjyLQ0QNkWUABEyK5YA>
    <xmx:V04Eaw1EhNMrH-eD8rQlSF7IQpuW5a8VRWTynYQXlrooDX71z3qAfg>
    <xmx:V04Ea24SoqPz9RhaQ00SIOl1LVlFfmH9uDXQdoFrRJBwiuoSrTuNNA>
    <xmx:WU4EazwhetjYDvhtGcFIIx4LttV9oKqTEPpyVwD-O4kTHbfvq5KvOzjt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D471F32A0099; Mon, 23 Nov 2026 09:31:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AYaYkjhCxsms
Date: Mon, 23 Nov 2026 15:31:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Christer Weinigel" <christer@weinigel.se>,
 "Jim Cromie" <jim.cromie@gmail.com>, x86@kernel.org,
 "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>,
 "Griffin Kroah-Hartman" <griffin@kroah.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-leds@vger.kernel.org
Message-Id: <4588af48-d69a-4b8b-af73-18c49139ba45@app.fastmail.com>
In-Reply-To: <20261123-b4-nsc-gpio-v1-1-b2d97eba2662@kernel.org>
References: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
 <20261123-b4-nsc-gpio-v1-1-b2d97eba2662@kernel.org>
Subject: Re: [PATCH 1/3] gpio: convert PC8736x to gpiolib
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 23, 2026, at 13:29, Linus Walleij wrote:
> Move the PC8736x over to gpiolib.
>
> Keep the legacy character device during the conversion. Both interfaces
> use the same register access and locking.
>
> Link: https://dtsheet.com/doc/85223/nsc-pc87365
> Link: https://datasheet4u.com/pdf/36121/PC87366.pdf
> Signed-off-by: Linus Walleij <linusw@kernel.org>

The driver looks fine and I'm glad to have the old one out of
drivers/char. 

In the changelog text, please mention that you don't actually use
the hardware and link to the last time we discussed this one at

https://lore.kernel.org/all/CAJfuBxztAe3vzzviGH3QJnhU7F68ecrafTLUoaR4BMskMp__3Q@mail.gmail.com/

so that the next time we consider removing it, your patch does
not give the impression that you actually need the driver.

      Arnd

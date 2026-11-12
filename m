Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522054;
	b=UWY4ci5n+F1ISgkv13ISsLshYaZMclFcNRAiUCN4MDtdSuimtHZpeMZDA6AuAQcERV2+
	 /88TOdngsk31QleHAjyP5IMDE9Jrust16OOl9eB2TqfgpLhkGqTWDiX0sRvcvculjm8eF
	 JjZ0KqnQmdZ857/lsHE09fEXiq4Px9HnxSmhQ5GlH7tbnl2ay6LwoHLQGUGnQ4wFIBokU
	 2AWtnUxXSkqbB931Fke66RGktKZi5ncR50pM6+7VVfXDW97DvN/GPAyaKjFzzURzXJGE8
	 CaVnBgXirSzLobF380DW6Qd8/Xv0rXRVSSRG9FlF4Ii6y6mlZRsmMr3YQOPk6An8PHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522054;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=mpprA3S6uBrKI3A+k9JU2N0Xl8rjjtK+Cdj2X3TXyhE=;
	b=1cNKI+vdRMQox9zXFraQY1OIPgq0VmYU5i+JSNALmPKTh25Dqh3F79BUlYDl839+8/I5
	 chJblWoLe81pewdCg2J+xFebFkRWwsDVd7/4kOHZs4q9YnS7M9UcxT9d+6r1fMYVTZbQ8
	 kKqgl6hthDsDxPwFbysmbiTmYJUDnpbasRWCrBAzIohJglR5nWmBmo30H5ufx+yTPR2rU
	 5HJ2aXIFx+i1My/NsE897vWUVp2vCCRbKwqRa8rYflhr/TrmBzXpnpnrPVMBvw213R1bN
	 Izx8TG1k1zGRn0EPByYzmrh+mQLrW4ajvIsrsD8zF8/duL1mdTduCgTjZiFOfi+Qs7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=KLw7U2vM;
	arc=none smtp.remote-ip=95.215.58.82
Received: from mta1.migadu.com (out-82.mta1.migadu.com [95.215.58.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CF5606A882
	for <linux-leds@vger.kernel.org>; Thu, 12 Nov 2026 22:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CF5606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=KLw7U2vM
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mpprA3S6uBrKI3A+k9JU2N0Xl8rjjtK+Cdj2X3TXyhE=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794522052; v=1; x=1795126852;
 b=KLw7U2vMxuB+y5PY75t409Gaz4crWUgo9gUptQwldrJhL/poKLNdn/U3RjsxiTMbS31Hv69g
 mFLmnsBh2qfZMSQtYLcLmXq/tMOHAHB81uKVa0A6rI28Gg0f6kz9RDE95iiE9urfsosGKt8KFRh
 e7WcKBAhf6ZOtUGOo6J7KR9IDpTxE8YKCqLbOz93uvg4QxmEABT5Dd/TKrgdl/yV4GjAr9r3hws
 an87L5ZYnI/bxHhP9rEyg8h3dLd780si+rM4A1+b88hRf7+LAonezpjSho3M7cltaxCDBaYU7S0
 mxrKbjNMd+4Rl4ECfeykeBSgf0v/wG0PbE3KIaqNYxKKQ==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 20d835dec25aa392;
	Thu, 12 Nov 2026 22:20:31 +0000
X-Mizu-Trace-ID: 20d835dec25aa392
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 22:20:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <4d30540910d8af03de850769e326906550b15574@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v5 2/3] leds: aw2013: Add AW2027 support
To: "David Heidelberg" <david@ixit.cz>, "Lee Jones" <lee@kernel.org>, "Pavel
 Machek" <pavel@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nikita Travkin" <nikitos.tr@gmail.com>, "Alexey Min"
 <alexeymin@minlexx.ru>, "Griffin Kroah-Hartman" <griffin@kroah.com>
Cc: "Nikita Travkin" <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <11724004-3e85-4f7f-a683-5ff511863bc6@ixit.cz>
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v5-2-b2c5e323a90a@postmarketos.org>
 <11724004-3e85-4f7f-a683-5ff511863bc6@ixit.cz>

November 12, 2026 at 10:10 PM, "David Heidelberg" <david@ixit.cz mailto:d=
avid@ixit.cz?to=3D%22David%20Heidelberg%22%20%3Cdavid%40ixit.cz%3E > wrot=
e:

> instead of comment (which should be formatted such as /* */), I assume =
you could use #define here?

I could, but then for completeness I would want to spell out all the aw20=
13 current levels, which might be too noisy. Or calculate it, which would=
 be hard to read. I think comment is the best for now.

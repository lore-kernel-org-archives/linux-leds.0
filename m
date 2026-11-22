Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323308;
	b=SNl01ZebCEwIVWlVf4rf7O/ydpygTJGXB7ErGQ100bOagVZrRmeQ5EQRQVdWvl1uTOFF
	 t6GFwpT/ibfshcy1enWidUGdQerYW3W2Pp/djGVwapr791UpiLknuu8Tr/MXvMGfkuawv
	 nTqsg/7PKT6HqE3bSIeb3I+run0DRyvYI9TAhe6bedlULTgPTfqbGHzm23xCWJoiV6pCp
	 Fg845KxX6Bg5jrb878OuWMrmGv1FWI6sGP1u8KIWb3Rx2wsrBh0obOZzwspnjBdCU7i5M
	 m2RjwSInJX1fPcY02ln1+CPIc0j6bqpOuEdncIKchLs35IXZEMVnzkEmFBWIyi7w91w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=zo5hV3nq2vAzOrfwjLwLFQ7iNUuGgnQAdTEhOY7Nk04=;
	b=1YY2xm8FEdcT5w0FWaYtc30NMxw1epmV+WglAjmx1622eqCM8R5q0S0tEGkJPpnImZ4o
	 hiiWqfMlhQTfis6i+5CQJUD4V7Ew3w8WllJzDTm8FzrA7wjGftCNSj+bMYRgqrS3AKBWs
	 l2HOOd6W7BfNKKKkMSoe3oPsTh6JVQ4tAkhMfG3GTShhJo1Kg4l0+FyPsMUkz918zJuX/
	 QnYxqsBw6c33zmtKjQ+CjkLmdtosm0f1UEeIGkGlhkHOA+Xz3W7WAkDXaqJFZQvvx2AQ2
	 VMX3LWWADqH2Yqq2v/7Mijt442HrhQm5wjIWCCiR4TrgHJLKcve8YOj8Kt+SrbKt+JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTGCWyKF;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD10606A32A
	for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 04:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD10606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTGCWyKF
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so6623532eec.0
        for <linux-leds@vger.kernel.org>; Sat, 21 Nov 2026 20:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795323307; x=1795928107; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zo5hV3nq2vAzOrfwjLwLFQ7iNUuGgnQAdTEhOY7Nk04=;
        b=OTGCWyKFZuWdrwICzH5qhVzKeOyJZX3Tp/aufBzZVXieQiqgUo5wteOFtFPdjtlKok
         WtDXfQ0iE+Qn9vpdtYbTMD4dgNj21yFzDR/XE/Qz8ECFPcEDtZIQBClS4VIw5O7kIxMq
         Fnk1zdSl3DtWUqMLXE0RhM3+OCObFnUUWdAtwOEsFK1vVZn8Niho68PM2rBjXId+Mx05
         RkdBhm+QMYkUNzC+dUElcjwUtvb9BNAE+QSNkWBbO4Pe5f76LBoSj9rztyGFHKQjT7EP
         mYR7TrfjKAosJwhZGqn4k8JwtrqibMZJuSrLILemOh0b+LCjInJC/lWJ7Mh7Xjc0BJaJ
         M17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323307; x=1795928107;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo5hV3nq2vAzOrfwjLwLFQ7iNUuGgnQAdTEhOY7Nk04=;
        b=wNqD9KGL2mzDLDx0hWv81tTnoaDiTvA6Bqw6huk902D7MZztnsd2rp325coIyzlkDw
         kDKgms/9bXCQ/ljmTpKIPKTI5XxHm1NGWTNygkNVXXrNPjtBk7HTiXaNs2uBxd07J/1B
         ykEsglPhEQMrg35vRdeFff85togw/z/ipoouViCwmSYFp+0XqTCbnsR4ZRdEWvm174WH
         SKYi6XgLwqfviNXQnlIBzfypw7ZPTGNysAow8rcfwq9zCpFRMyGFmQX63UkDMGA7ScmH
         s7B+GdD13vzD1og08FREFL6URXFtbk/4/jOiiOj6Y5OCtzVn0KDoY0qSET9//6TKTUut
         61Pw==
X-Forwarded-Encrypted: i=1; AL+hErGw71R1aFuip5AsW+glB8y9qZCv98gqnD64f4dizMD/9ogYS8xcfYne2fODlsqmyJK+hHiY9P6gIf/S@vger.kernel.org
X-Gm-Message-State: APuU4Z/5mZt1frYJpIEiuaaQbyT0PZR46f6YNaOdgR+atA94eIGFpjeo
	timTbXVf2KX35ZR7YIq9lLJ5UEL4+JH5uc9ADA8Ny/BG2l+l0r4ov3um
X-Gm-Gg: AZFdTZcFc4jbmgpM/DgUWtFOFvimTAQy9fe2gheFyBB3T26jSPpBvzEFu27H7w84m2U
	qMsstfXQCAnaWHrjwa394/sYqP8UmqHzyZ1a4JLmk+DXxeczQXcQloFc5lAjggY4YIR4HpxsHf/
	Vjs70RB+vgoMP6BXhatgAYX/BkUYGKkKRMISDJSbdyhQEI8ShZKnn66lDEQ2zpeGbrbwfjaxTWi
	S8ifqE8pW84PetR9Ye9Se+6+yfoXsF6QV1+UyDHSOzXOMkJMoe/pgXeCW5fJN5g10fRlWv9Y/dt
	blIM5jZXuzVaT7CU7Rq8xayWDv0Q3FrSOYlXuEEEXfeyX7GI2vv3ZbwsVp9MbC+wGqnGPbo8pLb
	85D/3jCZXyJ4Qkj+GP0yn3JXtxX5bxfzfFX2fltuGvaWmzCdQ37aaqIX0TdYuoVT8iVmxbCNKsw
	lzuNCZmgx3ZD5NjK1t+HT7N2YW5IqTPsQ4D4+ikvfocsvoZg/hxQCAwkh++wMiOlTCvDVSsmfo+
	wTzOt3VM2KoSIfWBOatx2is9I1tN1yQzn3modx2xwQ34etaMfEHuHF2CwYHAn7KJ7iaal9lSRxT
	X4wuW+dwD1dpaVBj+dox5vF2ANgQBE2TVpHTIFOoD3DlqR2um8X9AmKbuU7t+xXx4CVrgVA=
X-Received: by 2002:a05:7300:d090:b0:386:8bd2:da2c with SMTP id 5a478bee46e88-3868bd2db9amr5813273eec.2.1795323307243;
        Sat, 21 Nov 2026 20:55:07 -0800 (PST)
Received: from localhost (61-245-143-184.3df58f.per.nbn.aussiebb.net. [61.245.143.184])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm15989477eec.19.2026.11.21.20.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 20:55:06 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 12:54:55 +0800
Message-Id: <DN1GZS7LQ7BN.34S0SPYOQLG1M@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-leds@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v28 0/4] rust: leds: Add led classdev abstractions
From: "Nick Dowsett" <nick42d@gmail.com>
To: "Markus Probst" <markus.probst@posteo.de>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dave Ertman" <david.m.ertman@intel.com>,
 "Leon Romanovsky" <leon@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Ira Weiny" <iweiny@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113-rust_leds-v28-0-b8cf2f74fa57@posteo.de>
In-Reply-To: <20261113-rust_leds-v28-0-b8cf2f74fa57@posteo.de>

Hi Markus,

Thanks for these abstrations - I'm using `led::Normal` / `LedOps` in a
new Rust platform driver (`clevo-laptop`) for Clevo laptop keyboard
backlight, just submitted here:

https://lore.kernel.org/all/20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.c=
om/

Verified on a Clevo/Metabox NL57AU laptop.

Tested-by: Nick Dowsett <nick42d@gmail.com>

Kind regards,
Nick

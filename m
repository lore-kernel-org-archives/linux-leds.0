Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792514367;
	b=vnhaGixF+DczJmPMbJvKnE1/bP1Pj5ixmJbBRrgd8ehI2QMN7oFYxXXnb+Ljk2bepx7Z
	 uTNbIUUfuuZB+wNQZeHcaerlHJCj3otqffbq7yes63tP1HZeWvMfJKOXB3/zfhzjinu2q
	 onOfZmlYJfQYiwgsDkDsauu5wg9CoTWklNZRvly5y13lG2Nc9tGoZubx6JGcZhHqGPjww
	 0ioWeVjLY2Oj6OCSJXcuy5jCXlU7UYuRsiKOE/qseCIjpJaWz6yyzpoKsH6JM5WDBPS2Y
	 NOeENWy1/usb+yFZFoS0E9DyISIvVvMsCe64K4CbPJYxFgZzwAQ30/eOhM00jpDO6EA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
	b=CkSUZXZrb0KWfhCZcbtYzCxKbMhKkcO6i5syCbOmnzzxOsWImBRsduUZy2DntTMKr+vI
	 B9B8HzQcY88jBdnUDK1d3v5aLDphCTABxIPXZ4Lr53eaeRSIOXtlCCabvi7/DTa6WBttq
	 7HknoB2VnI3IodiahhAmTQ4FfTMYZdCJpuRDvQNxvqMh2wS5QiAFt2ZXZd1Dgm5ilbRPr
	 HQqo2ymucctjg4TVRI7hLVMgDngzGA3XZV4/SL/ErmzJmWJjs201/yElsnaAPscHdYgvg
	 Y+oiuJJRwrenIsZH4QIeHrJaC3dY2sA8LdCAobLe83DL462T9LVySi4trJosl1yra/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enkbmR5N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5784F606A32D
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 16:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5784F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=enkbmR5N
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-355724d032fso425333eec.3
        for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 09:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792514366; cv=none;
        d=google.com; s=arc-20260327;
        b=dcQIb45fE5nShBAaO2dXXn8TydP7gx1cGC3NJlRg9LIyvCeW3mIskVMSbwdGYmPZYH
         yJ9GK3XR8gJgXo5KLvTZ62pgHQVUc5I8i04XztidySqDjNOGwzEG9j+s4FiVBDv44RbV
         fud2rhEodst9wM3JObel4OPajiPq3xHyf14eqFaj9ntvBk3CMIJuQnGBRb12mQCsQ1AL
         ZSLKcmbtSX+8G27xvG25Nz3V/rMjzk89f+Mebuay8qCy4ioYQ3UMsJpVoDNNpH9zRZEY
         w3rY6d7nsu/MsQTl+MnOhr5d2dIIOUyaT9vd7Ragya8jg90ErQvvCL69j9M5jhQNrfgK
         YfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
        fh=z6OuPgIGnJbVOXsynCyWy/bIY2RDlRbW5ao4A68sewc=;
        b=aVZDWwvasysx1PbDefIhs9CN0Jo4upCnvMOUz0ngPO3OhtHfHCByC8gBD04bH6QkHQ
         JFeEfFx3q6G//rnTTByEKEVPqwYtDxo54sr1LWHQgk3Q1yviw1Zljm3d25L0ZdZZXDPm
         NGEx+ycHBFfyQ/lAwlj/nQ9N9P/f4I6fvt33hCz4m4kuUyTwV7ttNPaaLY3N1SD9KzV0
         xjSt6fQ0nMttKrYfhgry91IIPp76GaDTeKKFaBnpQCxQe2BqlH2enOMX2TuhgBKIsLfq
         sm5+mSHv2ofe1nLOD0w9XRvroc8j8oVwJn6HvfVNer7d17kUd2yrtNSEferSqIv5NEv3
         vT/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792514366; x=1793119166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
        b=enkbmR5NTVbQ3UrlQC171YQTmcaAcweChXaMlD/dH3Kb0NdENuVXXvN6HdylZ9SxOc
         YZDdTFSVaIlTSe+WbxvtGwjaue5Oso8RDImcyW75nMxyHJv4wJLaVJYMckH1jXWy7M4V
         jjVwjSnIkX7ngKBx12o/x0jHhkNsYjaMeEqeYPTlLs2s7qN0vYhvrJk62IysjOGbMHXk
         BKM0oi7e3qstE3umQzjkF5wcADd87bZr9CfbK5CVLXuY0F6yh6vIT1l1N8rExH/j8BuO
         OrzSzEVnZbIAFyjMi9EAa+l25RIvlyXNJ7A3AT9Fn38GUnYn3ohZjgFIHOUUSKMmjmwS
         d0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514366; x=1793119166;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cdkm/1auD8QI195+wns4rrwS9hItJzoaOrK80+ng1w=;
        b=v6dM8BX92cBj36e5n/hIEvXQl1OYhFB5naUInesc1bACAyurhiUhUifXeMRu3OSMiS
         PHQfGBOHovAq758f2GKFwUi47U+ubS+V4i/uv2IUNszIO/F/W3bTEIgs0i8GB7a0hAkD
         JQa4FUFrlFFwYqdkaof0UfTqLz5XXZtHgMDcKs6EIM0aXv9fWEcVIeQCYzstthKJCiYb
         x0TFOTWaSO92SshKq3Pp3MadE9BFcWjH8qf9Lh+brRzMhbiTiiG/lGlkB0fBog9AEYV7
         0sYSfKqEdIi4fMS+OOTd14DQzs54iGSp9GOnp/DUHt4x70lHPrh65R6zM/VzmrUieBdl
         H9vg==
X-Forwarded-Encrypted: i=1; AKwUvByGqwPQxX76QY5JqRMfR9yuq9URAZSZwQOZlq7c4/M+CDvXczVdFbMnFpjk8rWEDkxffQyC+w4aLvLt@vger.kernel.org
X-Gm-Message-State: AFq9FYKnOzuBPvIi/cJMo1kkXQZA9cZHRNLg5FI7DtCKxJPCXJZIFD31
	b0Bb4DcLmVRrF0tV2/CSgmo7mVier8zOV0I1upc2KP21LNyATcCWdZlnFBBseTZwKwhu1yh5YxG
	/g08Qv6zftQeyLl2964PlF1spqaVWX28=
X-Gm-Gg: AYBFou1KcSf66YX3u4GHNo/AFhKcvEWnqz9oHK+M+B5+MhFpAAI1uQddpoQco+YiZQI
	gbjrybCIWtz+WypiSKxPJdv7gnksLMQFUHlJTK3tqYcqYUFtxpTIyHutmU8e61arM/1/vNDdOk2
	bQSRUil6fGX6YQOhXzY5gpTU5kQNs5Bqwx/95Tmqt4Dyz/zQaUpwXptXh9dVrx3oKOSYOj1dOh5
	qF54Ipl3my4Ejyt4gyUuEElQLfF1XZZf10hRNeMwcT3W6WUNl7TjlQGVP7EVgfJmU6b8Sp5OPFa
	LouLpRuEjhm1c4D9ZbB3fBcn3qLmUGfXsgB2fw7HiCSaHW9t0rBiphn2BvXPeCAcQQuen2JyMV/
	nSlWzQz7Joq7JCbjlFwnvoPLbd8+3e7JBH+FrTVneQ0598ON5LTXUrT/5GsdHwaM3V3Oan2w6F5
	ZmT9nf3b1+Ch4jwvBt0UMRvNJQmuaO+efDZxH0Pe+eSI9xGWEy9TPRTi9Fx1j8SRoLxwVY0wS0t
	ybZ4ttLp6kaGNFt4yh57HepeFXxGYHEq6Ib
X-Received: by 2002:a05:7301:da84:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3619b30919emr24534750eec.0.1792514366275; Tue, 20 Oct 2026
 09:39:26 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-rust_leds-v27-0-2c296d8a8e5b@posteo.de>
 <20261016-rust_leds-v27-4-2c296d8a8e5b@posteo.de> <20261019143818.GC2663669@google.com>
 <236149b4c90323f412d6385c034a78908013e2d7.camel@posteo.de>
 <20261019160407.GG2663669@google.com> <14fd9a916dd0792a74ca01ae073e714f95a9c780.camel@posteo.de>
In-Reply-To: <14fd9a916dd0792a74ca01ae073e714f95a9c780.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 18:39:13 +0200
X-Gm-Features: AclHuK8raElhkbPr-7bZyBZSZrGqtKLbWS10csaRXDChmKEDOAjNZ5GlvVMRpWY
Message-ID: <CANiq72mRvmHOM3wHseReRXUCgpWh2Qzbhto5LqG+eOQ_pUGLGA@mail.gmail.com>
Subject: Re: [PATCH v27 4/4] MAINTAINERS: rust: leds: Add rust abstraction entry
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Ira Weiny <iweiny@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:23=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> drivers/ includes rust drivers. (e.g. drivers/pwm/pwm_th1520.rs)
> rust/ is only for the rust abstractions (the layer between the C api
> and the rust drivers).

Yeah, and we will be moving soon even abstractions out of `rust/` too.

i.e. there is no difference between C and Rust in that regard;
subsystems already own their Rust code (unless they explicitly decided
not to).

Cheers,
Miguel

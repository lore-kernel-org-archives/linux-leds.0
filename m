Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574D830C160
	for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 05:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945048; cv=pass; b=mrktLtKYeXhdHMKVi53TOhlVhduMuE6UUN2ZZDcd/D1JyfDwW3uUOhmZ/OfiDO5f2W/cvNROY6KdSl5MbvIQjnEtzXt8Pfjmj9NVgCf05mivOnAeg/aAukiWkV3JgovKK2aGnOJr237SHAZME6PoYK3HCfNyjlKAkuP1bho//IQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945048; c=relaxed/simple;
	bh=MfH+OfqUIqkC1sWKkiJm/aqSYamFeEbiXsfH5VRilGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmkJVww8HivjhKa/CHZnUZnoB8czXGONJhx9sM07naEML4nzl5ZCR0974/oye/5UQvEj77Lswniv1KE1HvNn1N2zzJMQVPclOchKO7rcWzxf0dhFqWsUa6kAoYMv8GDSXaXJ4MnlDLuikcNH1EDAA2/0gxhXw7JiQhgMu5b6K/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIyPntya; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIyPntya"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304d555293aso693084eec.0
        for <linux-leds@vger.kernel.org>; Wed, 27 May 2026 22:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945046; cv=none;
        d=google.com; s=arc-20240605;
        b=Ab+JOUQBv76ahS36+Ps3GhhxNCh045uswuuT7loeRU84DU/cx1jab2FbsrXeqHK6+l
         /hnB5RNcrXw+ILvy8xcLnl3jIYQrF3q5tr3TAhCEJ9wia9zUGqHWw2DRn5rChARkHHlN
         miDZKbsyV/OJhvEFHVIy26k5SGiYZcJw4XsnB5FgLwEFeBHr1sR+HwPTt6aUN5RrV05l
         rrDaxVSaRTzo1Zt8YmHX7BD9WeHkbJmx3sJXK2PnyWLWnOqvRMEmVhmNPz6n9O06dN8/
         0EWmg3kr3Ibh9TDRAEzY7hGeJZX4qbXVI1DW4bsA9tcuUYgfKfyrV2GkyGud+7euUgup
         ayBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MfH+OfqUIqkC1sWKkiJm/aqSYamFeEbiXsfH5VRilGc=;
        fh=Wtl5WG+yxFG+Sacbvtv+wnewyXsjMoRnwrN8nfHc2Ho=;
        b=LC5yBoUxphQX1XIlhq0cvLPDcJVjhPdgSZtPxcbil7oHzOua+xcxLWGnuZcI5rEVNJ
         KvsqkXYWOLJydihJnVIlBxaCRnpQZupNNkuOXO41ZR9z6DCZviRAOrnSOKUM27/I2MXV
         bFG53s022+WJG9awNhDH2U43nBCfsE6qc+BWLIX9bxU61H5nes5p80blmQK/DvPaO239
         8klZrxYcgpk5cFybhZENjcgswZiYlkRuDDnDjMl2/OuBZkL0MI6i1l9cYmB0iQjW2sX5
         +y5aDhFOLISjZtY/GNhuv3ALjsRc5BLDNrvCwLludPsnQUgaIIVtHVL7i5RWK7l/DPjv
         W+Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779945046; x=1780549846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfH+OfqUIqkC1sWKkiJm/aqSYamFeEbiXsfH5VRilGc=;
        b=FIyPntyaQci7Gow3k5Tv9c+eiSQuvMqAIg8GauSmePGIb2DAXnmUuFcEBNNEbMKY7l
         z5IfrSIUcto7gnwcIRtowu4GcOZdDKVYTCu3Z8TiCfbVGGBS4ikhaknmg3LDgf41mCkD
         wMmKMcuvP0uX7NjK90oK2N0Z1AGDJRgSPGa0tVqwM7pOVpGcKGmSZMD7jbQtpLxd4iyK
         mpH8+HdDfH9pwkhFQWl/HZob7rD6I5NUQybbLojqgUOmMYMfNp4BIRUVQBZKD8XHDera
         yballBJqN+9CsqGtlZUeZWioS3jB9XMzBjtpeUofLYCM+sdyX/BhMpUIy4DiWf4zEh5X
         OOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945046; x=1780549846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MfH+OfqUIqkC1sWKkiJm/aqSYamFeEbiXsfH5VRilGc=;
        b=h6kOCxbBbejoffalJ9vbl325R4OwqT8eVsk3kjGNRGd38IP89wifODtUTqTOrBB1kQ
         8DvcUSiCw4wlRcOyXnOAYK9mJ/jXm5nmx6HpI7Z8D1kJ/c73mC3DUobwo3FD+N1G5oHa
         y6khPErh7p5F8jXUWEknOKJxXxh3L1VToOVFIC/BKSxMxIbqZDpVoZcyOqM4oFy0rMrv
         YGwqXFCqn1/cGN/s86NbAx21I/f6hRYQBl1+cJ3RACZpYgyls35JpchuXrqJTg7ERtx5
         qkY+f1AM/JMuQF5VidthRL3qEe2jmF0otCQE03QlDHujUKxCynpkfHsRQcDvOgKyevYh
         RBVA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ec/D826ED7o2IWMZBAKRbyadjUg0afIlZDac7salru2UYcQFcc8YD3JzPQ+ItL45fLIVcY0rQYJ6H@vger.kernel.org
X-Gm-Message-State: AOJu0YzcWny2hn/wH082fc49EOACqygDES22LXUt4zlpn5fHTC8uj1BP
	zyBBBy1Wpdbh5bS8IR/l18n9/iSnijDsFqjWizw/BMF+uqYbDgPDqn6XPt3KG0FqAvd35Pk7ofj
	hqzhanWaYAJSeLAWsFTjYHdfjj+gTmuI=
X-Gm-Gg: Acq92OFVUuCxyBxWGDZ4MWiPp6KhQx/hwetE3ZEjZGc+JhsirQcq/07fL50M2nCTMQ5
	BsqtvaGtrI+IAjasx70FaQXnxH4fH52p1wK+cstU2f0nnoYIiZHzous7eR2EUSi3hMQr0Dmkovt
	grs6CKsH5qCDz2hQ9IzKZHwGNb1XVPrhINmQWzoBTzmt3nDsEmPu/Krv9S6p3H9QATnc7O+dxir
	NN/xlPqbospzTSSfqlyMQjYNxBunUm9pJ3M1abcWyGUBZ5si55TOP12ovKIWwB/uXSenu7Vd86q
	CID5O1ltq09UTJobnhk=
X-Received: by 2002:a05:7301:fa8b:b0:2ea:3370:6e51 with SMTP id
 5a478bee46e88-30448ffc5a9mr11709293eec.4.1779945046369; Wed, 27 May 2026
 22:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518095907.36158-1-clamor95@gmail.com> <20260527144619.GA671544@google.com>
In-Reply-To: <20260527144619.GA671544@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 May 2026 08:10:34 +0300
X-Gm-Features: AVHnY4Lq5d5JMdXBzoz6BtIZMrqkYtiGSsaMXY6hInghOFfRu3LWOak5AA72Ac8
Message-ID: <CAPVz0n285opk=xwzEs28aitTZt-m_OtrvHRx0RenJrmV9rbPqA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] mfd: Add support for Asus Transformer embedded controller
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:4=
6 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 18 May 2026, Svyatoslav Ryhel wrote:
>
> > Add support for embedded controller used in Asus Transformers for
> > managing power and input functions.
>
> Once you have your Input Acks, I'll merge everything through MFD.
>

That is awesome news! I have a few minor adjustments to add including
input adjustments Dmitry might require.

> --
> Lee Jones

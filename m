Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B0946AF18
	for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 13:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035974; cv=pass; b=JB7MzigRSAI6rrunLXEAU747/vRDpxc40CfGHeipyl6EgwlAfaXwpN8V7NVIl0uh+is6NX64FlL/39bKmGkCNMYB0QVRxcuA2mR/453sBbmL2BKJaAL16bQfYbAsdLBB39jSUkiLHz3Nc9vPw9rKtIV/cZlAdd9qNxFzKsNrJQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035974; c=relaxed/simple;
	bh=xMYgbeZWEkYZKWpJP/1b9kbmlPmh5Bba+PqXdvA1L9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3qh8Ui8nG9boFu/Llx3SAEiXiObRy7lf0I0JK88VYnG0ytgDeZVZjdxts+IZ14kVXX+MFK9CT4q+s/lr8G0WHkX8e0IPveEj9tOvpx2jeJHAkrc7PJfjKK+VC12E1rtlzfiSTHhIs47CdsFn71NrRNyEgp0iyFFbrKJAM5lq3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1KybUSF; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1KybUSF"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-848882fdb18so809622b3a.0
        for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 06:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035972; cv=none;
        d=google.com; s=arc-20260327;
        b=NhO1HuJJLeSr91FW2GYbZ+JaRg9U+38IVpHX93hnZ3vudrvbXf5T71JdZhxxrZ6B78
         QV28uHVFPSoZn+HPWEQ2x6cXCysEhQHzeRNPwmHproGl1/FOop4jJiUwKrqCmvN7U1XC
         EHcq6y1pnBszw7zIoYr/2IUipcXpmVssOoo3uzMdy20tzDCfjW6edcFosE//GG8vTfqU
         A17Ca4wJNIZjj5VuSd6f0kN8sqSCw6wobpDMMRwIBZAqZTXobujeeP3jSi4Pa8TFLgpt
         EFRx+b1r/UsDBWxSsZzT02cWjdAUtags1qVtYbGEURUMdkJ+cJv6P8n7X1vCj1BQWGd8
         MgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xMYgbeZWEkYZKWpJP/1b9kbmlPmh5Bba+PqXdvA1L9g=;
        fh=zeV+dgO+WBZPkPXtrSgj99Hac7Vcw89URghBO/sl96U=;
        b=rdHmZM7GJLKzDixXQMhGye/wEbRxrwF8PSt4B7zlJYjk1yagPX5HEamZS0Sqcq+bUL
         82UfcT3U+GMPVnueSynfLiAlLGEcUX8rjX3w85yZwbhn9hUxovWt8dCEcVkuLh+d/YR0
         LEZNLQPpaah/UbxKLoqKUPihoXXjf6/kTdfoS/xYjxgCw13LZUgqcgFAezDtFFRLrVMs
         YnWAQtgK9oPTZ1UQoi7TCjKLmTbLnH8KG2kVQlOmiWrgFW2hqwnRWqrv+dcYYaXx2CXJ
         7lKO0F0Ti2n4jmvJwwDMMMGTf9rchhFER/1C6CTnw0epuNO9h+ziU23+iRY88FI7K2va
         RNUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035972; x=1784640772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xMYgbeZWEkYZKWpJP/1b9kbmlPmh5Bba+PqXdvA1L9g=;
        b=O1KybUSFHz0QdVul2k4o9VEGyKBL6uHP//tdT0Mdcmjy4tIEXxbFxE7c2P00asfBky
         TsnK2HZDQKGxxWs5geoIR9LboD6ul49LJsuU/H9Nf6Y2gVnXejBUBylq14ZHO3g1LNM+
         qCPApxKO1IGmye51vZWYLuoY4PLjFvA/xxcf0N36UoWRCmo/Tk2UwHa8EOcIXENrY132
         Ko1C1T11oYkzeIOg2//cJYwGAA0agX6SGKP9l44NvPtFCO37sS38zYusILJd2w+Aa1aw
         bt8Fs8AZ1FceZqcRsxIrLbmSJEFY4jxT+KU49vyaO9p1MxuEQyJUf4Lioew2GIMLcuef
         s8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035972; x=1784640772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMYgbeZWEkYZKWpJP/1b9kbmlPmh5Bba+PqXdvA1L9g=;
        b=brVjo7oc6j6H8mC96r1X/V9C0d+h8LGdh13q7fOm9bz6HyE6vGJzUU75drnbV91zUf
         4YBy1Xep42w+7ZA1cUyq1YTjx57x8Rhq4gWLnIkfYSoLmNunQ9su1T9khld92Tx+MZJK
         /oamTJbsztMTj0DPZH0p0PKPa/+NWK2heKEWc1lFLe5YfEsSl/2Nlwew0sXgrRs1kg08
         l/tsCGo+U0V39Zc+6yz2A6WusDnimqRfT3yfSfbLKkLMPnyxRiZwN2cycFOv1quGfiPT
         7I/QOPgCRnWi9u/jqlMJsLSuNi7CLjl6F0aQB0qkt2Rctz5ZAS3muvsDTs+gG6HGfgpg
         5X5w==
X-Forwarded-Encrypted: i=1; AHgh+RrrpuAF9obj1FxfDYEjGfFAQDkoSV1so0FeBb+nigH5EYJhOWbbgBlz5bb/eYXAni6AE1uMTC/weJDm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0MlzwzzmA47XD78AdTOXHauBzuwzYEaPECTNMgI5vyZuNSbd3
	+Q/UdgK9pw+SWar1Rt5jVs5tbb/kjk0XPGLMmYVu+aCwHCsF+3OezErVsWombXWKyFP0gA6kS0A
	otZZWYHQCrUodfc7CMc7TWMqUHmkk7gw=
X-Gm-Gg: AfdE7cnWYvqoB0nBnSCrD45eRsI3hdeysRgkM7GIe7KgBHb2o8RiX5uKVfZfJtFQfVN
	xDgFRVLYSsl1WRjHktjN2R9iadXeukMoNScd+cAZl39cYCtmej4DsoYtmhibH+lSZmgJ6U7om2f
	68O1/YKiCMDL/8McAs2YDok+fqoTi2fkLNi9CWCfSL6PjnbXYExCNlPFDTy5QbMnV8eG6VkwL5X
	pYxrCpMiygQYv4UOYrAwXQ3vh0sZt30/flXVhqtyyBH2jhdauiOg0Bc9udl2QGn9lwx+GCM7YA1
	K0Qhw94Jv2Iz7U6bCIWyjqfMBp2DCw==
X-Received: by 2002:a05:6a21:398d:b0:3c0:9c19:65c2 with SMTP id
 adf61e73a8af0-3c110a7780amr14294440637.74.1784035971780; Tue, 14 Jul 2026
 06:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-7-clamor95@gmail.com>
 <akeHfV45fs_wabFl@hovoldconsulting.com>
In-Reply-To: <akeHfV45fs_wabFl@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 16:32:40 +0300
X-Gm-Features: AUfX_mybrBIYYttKuc4kdlGjodzpsKD3b6Tkn0zZS6Q6ac4kDrP0-C3ai8FD94Q
Message-ID: <CAPVz0n1groC-4MxU-sjyPEDHYWqAweyBmVNC+iX4mVa_D3SnDA@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] mfd: lm3533-core: Remove redundant pdata helpers
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:57 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:23AM +0300, Svyatoslav Ryhel wrote:
> > The lm3533_set_boost_freq() and lm3533_set_boost_ovp() functions are us=
ed
> > only in lm3533_device_setup(), which in turn is only called by
> > lm3533_device_init(). Incorporate their code directly into
> > lm3533_device_init() to simplify driver readability.
>
> Again, this isn't needed. Why are you removing abstraction that improve
> readability?
>

Adding helpers to wrap custom regmap wrappers seems redundant. Regmap
operations are pretty self explanatory without need in one-time-use
helpers.

> Johan

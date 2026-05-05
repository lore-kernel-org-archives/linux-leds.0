Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32147F2E7
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990629; cv=pass; b=VGqWRkHcAP0euQQNUa7XH2GdkVh4dY2O6ZySen/UsBdUHDw7FQpmOiiX/yLniaiq5N44FmljJs7QAQtO7r+0ZLBFSHbHStJpL0ancwAiAcP0nRwQBkjEBxtVdQAMSv0KHPH32BM0iFI48bP4VDI0+V6IIXcLQpgcOXP5oNbqDMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990629; c=relaxed/simple;
	bh=FB2RoDWHRP5TG5kB/5M7XrFIp8sR/BsgKWGfpjGsJ7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGIrjg1fG6Yr7+WsCpyasKv459+1qycJAj5uqayy0B2y7i4UIwbsrlLMej1ucflVFvyS3yWImyw48DQZIS7EzLSNbjhYzPxtVZMW5gD5rAkUVIfBVDHIZbtNgFSb+qzlQslPxuVnTb5XoqYU4xud+MAyQ/ffibrAKgOstW9p0fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pzl3OPmN; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pzl3OPmN"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-464bba3a9easo2693160b6e.0
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 07:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990627; cv=none;
        d=google.com; s=arc-20240605;
        b=SEuB9AIL3Ip5F4MCziTkHRvcYwy5zzS65i3k/YgvXn8/1Oct0cie8lTsYO3aNZdOYv
         D8PwFFM4Q9+e5+6sm8p8lJsCmkzLoR4oLlKkzPkMdP0rmEMReXJIxXDVM8ORSWO8yXte
         KN7zK2Q2Frno17FrU+dOyLz/jnS1l7N9c5oqqaElrnGIpTV6Ba9T4C+IptVVtas+of8H
         LDXVwebWgWsrlQhX9nGqX6qlYHh3zzZbSiRnQE/sd0JE56fdNcHd7nZP8+ev+FPOAruD
         ODMqi6m9do/2KqPAEv5ESQIvjWI4AcDw4oEEQ2SMd/Sij9uLge/VzorUX/nG8dnkdiNU
         zEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FB2RoDWHRP5TG5kB/5M7XrFIp8sR/BsgKWGfpjGsJ7Q=;
        fh=QZZJltXDTdH3hag43w31ymmH0RrVsijlEwlC9ZoS77Y=;
        b=gUJeCNTJEkLZTKPwOtq9Cb8zzKxKzpiI9ZhXdf/3W3HphAz8zdVv6AfJp1B+1qxILx
         kiG6COa+hmkzgzWEwGZzAaZuuCGfWMxC2sbUYciL/zAgeKT968K0UcjmS7vH4oRMlYpk
         J/FUiMmTAgiwelLqwOMkUblZ6qgMxkykJja5o8uIyhOuRQhobFUD5XklSxm5DN2aReK7
         4jms+shJnixJb9+RFuVvFG3U06hijpSS0ME0K/Q19pfj8Xx0kJK7MrRLv/g2emH9EzAN
         8pWTjYikZWRDqE474E0JLmvmJ2g7qrJ5jrIUNUxOQkn16bcaVGsV4ZzYSX2eWu9zGXqp
         0uPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777990627; x=1778595427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FB2RoDWHRP5TG5kB/5M7XrFIp8sR/BsgKWGfpjGsJ7Q=;
        b=Pzl3OPmNbRFXefl9IcOnZA7H9fMzRofk5oQ+2HSS1vsO9iD9sJrjwwbXTK5YieAQMF
         CaJ1+dTVLk6GYf8mryxwZegBd+xDZq6ZC9yBqF6/6K34p625kz6Q2ARKA2cZ29CWbUpd
         FLHdSBHl5xAKp7GGfHvxDWtedmG2JKpCX0aBvTzk5EiYUopWd09qkD+oh8NwgFmnCMGj
         ZAc5rE85g8uC++QPdij++lKYb1Ibe4ycdaTLUkd5dZq1HbSh2pUCV57EenppwJxsetWX
         MRh3sY/2kfJegNqkrCa+UGe3Yp6OdgVbd7Cj743W3oeiKU2Cisf4pv42h+GaU8M10Eew
         Wflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990627; x=1778595427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FB2RoDWHRP5TG5kB/5M7XrFIp8sR/BsgKWGfpjGsJ7Q=;
        b=rkaPag92ZtdUSMp+S3X3Wf7C2lOIagAObFq83J4GadBHc2bs2xw5OZQI6uj+pdY5sw
         WsLPj+zAJ0aduWERjdb1nxAU9vFyHtak+lMPOG7HVslOJI4yOdKzFvSslfbHjaot7YzN
         hMI++293SkubuD2fWEcv2t3tALo4Ul1zYc72DWFlngFUHMHRQXTznF3hazxAVATZkEnn
         IyHO3x4kPncjcxOee+n/oB1Z5KxI0agA/rkNra8mHMWwrgDS0AFiYu67/M+CfvSJs3sW
         KULRgLhVCRWM5G+nluDoNxQD/CwvhipibbOt2Md0BGrM+k41fgW9eID+u6s/BvqDqCyV
         xYSg==
X-Forwarded-Encrypted: i=1; AFNElJ+snM6Dkiug8m5hZLu01AzHJcIB2I5YU8cLfylI3MO+GNUPYN5s4mI5KR6WJIxMzjyWI31yTavxbAH0@vger.kernel.org
X-Gm-Message-State: AOJu0YwWlFtWtzef1nqMceyH4+ptPxiLzSJzBh/NPOFfj6Tn1Ba7Ss3n
	XXJhfkBG6jAj5GgSd7dQ7kRdsmSQAJ+8WpYnNJ7p3GfgXeufGA8GvwWoEB/6ySt7jvAm+WEi3FM
	AolBTMl37SCvWr2m1LWVqH/ixXRxy55E=
X-Gm-Gg: AeBDievFa98LAuJuZtgI9/DKKNf2ijWWg6j3rFlwpoXgLR7hEBgCYULof/GzUbM5Ju4
	ETUG1nTdvxATUqPhrMYe8W/lHZ2i6wEaSwP6TLH7+JgBBej+sJIyo9I74n/zGUFYYUw7f8L9+mN
	TAyzPWc9uFmgtmFI+lNzmTlvnJ3K4D/JAwHx4iz13JmmKPFU7X6MnVN7xYq4wJInxrg8z++kSCL
	HdGZhqrpNbiQBaKJl/czWTDdBrFTU/SClH5Pj3P6tYAuyIsAjq0lXCUfPlD4UsVrrUFBT+lH8P6
	fIZGqW8D7SAcPL4IKHoa8zEDdC4=
X-Received: by 2002:a05:6808:f8c:b0:47c:374:20cc with SMTP id
 5614622812f47-47c892445ccmr6953376b6e.27.1777990626486; Tue, 05 May 2026
 07:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503072643.2774762-7-jye836@gmail.com> <202605050414.YJmW3t4y-lkp@intel.com>
In-Reply-To: <202605050414.YJmW3t4y-lkp@intel.com>
From: James Ye <jye836@gmail.com>
Date: Wed, 6 May 2026 00:16:53 +1000
X-Gm-Features: AVHnY4IHW_EApghA23w0AimDU8GeJhlp8R6o_CN6px5MGNoaZm9YKYzSqzJ4U4c
Message-ID: <CAEV1_7HRUhPHorhKoaC5a1f7-hyLpDWrLG29XHfc4SmeffpmpA@mail.gmail.com>
Subject: Re: [PATCH 6/6] leds: led-class: mark classdev as unregistering early
To: kernel test robot <lkp@intel.com>
Cc: jikos@kernel.org, bentiss@kernel.org, lee@kernel.org, pavel@kernel.org, 
	oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	denis.benato@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 12:24, kernel test robot <lkp@intel.com> wrote:
>
> Hi James,
>
> kernel test robot noticed the following build errors:

This is due to CONFIG_HID_BATTERY_STRENGTH being turned off, I will
fix it in the next version.

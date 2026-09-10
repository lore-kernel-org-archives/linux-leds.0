Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903CC3B52E7
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071856; cv=none; b=d3ov1s9opLQGzaRRauF2ibadQlzrWnICG3+Od62SktZy+XfXCKBQBKb4d92VfIfCBun5oAqg5fUL+dwtk4U1S3nfYdR/BB2ju/2ZjZO7xaOfloJKCIbkzpHqwPdZZVDFMY6ZiqMBMQuyMwUGEorZdGGufNnfVzHeU0sKEq+3or8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071856; c=relaxed/simple;
	bh=h4aCxdhy1tGoV6lGKVJX0x3mhzD+2ezFEQ/0eFlBe+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeKmeYcNtdxKROQCX1ocCtDWL3151RaUS/Dsy+z1l0vlJhxo4w2u6D3m915Fon9huHjbwp58a19kwOuU9Svw8bnZJ2L3q5H586IPKYcavQEaK78zWhsVb7hspTj/jfAgVD8TkDnDXjuhyhNGgnSokmSc26Jck3pBsLlP/vsBw5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5hB4aET; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5hB4aET"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b3c37877so189180a91.0
        for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789071851; x=1789676651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0rAC78IGmF6UMoo1efDtTikBTEY+oo8toLUqaRvjb4=;
        b=W5hB4aETjpYFPz7+aqlkKe68+7eovknFf0GKABeP1CN74iKs3ZCHOhHoTedBZtOm7u
         u6JeD35sfPyspazqsqC8ZOXp0cPNgvnlttFJZY2/lFJ97zRsEBp1KMDKMBeYCk9PoTrc
         rC2y+3/z3tz9yOr5oq3uoKpi9grbPdkTvrCBIcN+g0E0dp347l7QBHSEThJj4kzmgbuN
         c1tYdySZpmrxZXbS/YG1TviQF++BQohiU0Z7v16bnYFc67a/g5qLu4gAyiJO2qRa8Upm
         RoiqHg9gtmcHtggdL7tAyJyU8c6UdhbEfEIKD2hLy3KHK2wQNZdmsaSeQIhSvvaZw20/
         9GhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071851; x=1789676651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0rAC78IGmF6UMoo1efDtTikBTEY+oo8toLUqaRvjb4=;
        b=Rr0745konfMEzWWvFcIdnvotNZ9w793/plUvrhVM7nHkngL9RBPXIHoYfRqTd4GVbf
         TnNc0M+TxcH/qfESGqRd8GXSUWOhT2Ihk/QffP9GYa5yUqBKXZSZbO5yLwwwj4BPBPJE
         JUY2AU/7ATDWNO4hct8a7FNqh/QE9YJYKPj0DWWU8jQlIGe8mTTS49bSq1acqMtKVT8D
         FoJo4anTPEp8UWbogGccCfFTlNQODUnVani6v33snndzhmxF1g8xK7ohWh7DKiqGLnAl
         APUJfPJ7SQp0izN1cQzBaCM4SCHFDO02WdqRA6obe3pthU5fesFbx7CQv4DlEeYA0MaW
         QIJg==
X-Forwarded-Encrypted: i=1; AKwUvBwfajQ5g9BEN9jOu9xjqd1HjOKdXpAzGRH2S8rHQQKyLgA4y4ZlAwr6O/ePGD2Ta4x2QDOfIloGJBR5@vger.kernel.org
X-Gm-Message-State: AFuF++l2ozIbW3+jMrnyS4q1fn/d0gz3NZKbNBKzyD7dY0sKEy4GaNG2
	6qAejvZqrJXjWtw9oc0TJ4GoykymEW+90ayqsAfno7OU+d7mccIufgZB
X-Gm-Gg: AYBFou2sTdU6JU6G/IPMpjUIPjokqIvbJB70v8lfazfC9fKRfYoJkhbDKv94oRghDG2
	xlQAGD/fBNnHwYUfT5E06++U+XB2aR40U+g9U9ClMriRwpQyLdVUoFzOHnJDFhQovyGXK3ifyWq
	rLTtD2SXbgY4hf7Aa4p9ANW9VjK2eSj7wNDILeGjqMyfOBQXziQVYReNCNRieYOb3sC0TdkJ/lk
	zE232OdnrFE3xdCl7Kr1//jb7R58unAE85+QnagAdXEsC582SGneRDqBVT5d8NpLkUvVVxA+yvj
	bgdezm7rDztCB52BvYAk/Rwl9MoaYAb/BCchB3CKXhf+qkkVUW/y8qLp5np8AnhnURjsD8RJrOw
	CRb/EE5m/8SNSaRsqx5XF44y6VMMWoiV7OtNd/s43a0VAMh8iK2sbodtQ56nFG4M9a1M7Rqkk1A
	G9oPVv1IvL/W6Nv73FdrVIP5l8DfGLKK8fH2GHy10B1NUH0uIvLcnNRdPkhRfQNU7v4coFWFz1r
	7+AmpQ85Kbzwkq8idLBtK34/jFNU23O2f9L3ciKGz2UjS4rwgF43Yyf3JywUit2AQ==
X-Received: by 2002:a17:90b:5807:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39d9c1befffmr644645a91.16.1789071851148;
        Thu, 10 Sep 2026 13:24:11 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm973848c88.1.2026.09.10.13.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:24:10 -0700 (PDT)
Message-ID: <36c6e08d-4856-47ca-a45a-018cc563846e@gmail.com>
Date: Thu, 10 Sep 2026 13:24:09 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] HID: hid-oxp: fix and extend X2-family controller
 support
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org, linux-api@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-1-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> This 15-patch series fixes existing hid-oxp configuration and RGB issues
> and adds controller and lighting support for ONEXPLAYER X2-family devices,
> including the ONEXPLAYER 3 and X2 Mini Pro.
>
> The fixes correct the M1/M2 defaults, validate input reports and RGB state,
> correct brightness and color scaling, serialize RGB updates, and make
> configuration state and delayed-work lifetime local to each HID interface.
> They also handle controller reinitialization across system suspend.
>
> The X2 support selects configuration interface 2, supplies the required
> three-page button map, and adds the Gen3 protocol for joystick-ring zones
> 1, 2 and 7. The Guide button and rear logo receive independent multicolor
> LED devices using zones 5 and 6, with monocolor and breathing effects.
> The final patch documents the controller and lighting sysfs ABI.
>
> Patches 1-10 contain behavioral fixes. Patch 11 groups existing declarations.
> Patch 12 adds X2 button maps and interface selection; patch 13 provides the
> shared LED representation; patches 14-15 add X2 lighting support.
>
> This series is based on mainline commit
> 50d05c7c76c96b90462f24debacca971d2e86713.
>
> Testing:
>
> I tested this series on an ONEXPLAYER 3 running Bazzite 44 with kernel
> 7.2.0-ogc6.1.fc44.x86_64. Testing covered front controls, rear paddles,
> Steam and Quick Access behavior, independent RGB effects, brightness/off
> controls, and suspend/resume restoration. I also built the module with
> W=1. X2 Mini Pro hardware testing remains outstanding.
>
> All 15 patches apply cleanly to the stated base and pass git diff --check
> and checkpatch.pl with zero errors and zero warnings.
>
> Development and review:
> https://github.com/OpenGamingCollective/linux-unstable/pull/13
>
> I used LLM assistance for protocol analysis, implementation,
> documentation, code review, and test orchestration.


Hi Andrei,

Thank you for this, a lot of really good and needed changes are present 
here that will greatly improve the driver and it takes a load off my plate.
For the patches with Fixes tags please add Cc: stable@vger.kernel.org in 
v2. I'd also revisit which patch some of them fix and make sure the tags 
are correct, RGB and buttons were added in separate patches.

Thanks,
Derek.

> Andrei Aldea (15):
>    HID: hid-oxp: fix default M1 and M2 key mappings
>    HID: hid-oxp: validate input report lengths before decoding
>    HID: hid-oxp: retain fractional brightness when reading RGB status
>    HID: hid-oxp: reject invalid Gen2 RGB status values
>    HID: hid-oxp: fix multicolor LED intensity scaling
>    HID: hid-oxp: serialize complete RGB updates
>    HID: hid-oxp: select brightness policy for the new RGB effect
>    HID: hid-oxp: stop configuration work during teardown
>    HID: hid-oxp: keep configuration state per HID interface
>    HID: hid-oxp: handle controller reinitialization across suspend
>    HID: hid-oxp: group declarations and protocol definitions
>    HID: hid-oxp: support three-page button maps on X2 controllers
>    HID: hid-oxp: represent RGB LEDs with a common array
>    HID: hid-oxp: add Gen3 joystick ring RGB support
>    HID: hid-oxp: add X2 auxiliary RGB zones
>
>   .../ABI/testing/sysfs-driver-hid-oxp          |  196 ++
>   MAINTAINERS                                   |    1 +
>   drivers/hid/hid-oxp.c                         | 1743 ++++++++++++++---
>   3 files changed, 1623 insertions(+), 317 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-oxp
>
>
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713

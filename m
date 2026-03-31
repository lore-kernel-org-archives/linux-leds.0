Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179513A0E84
	for <linux-leds@vger.kernel.org>; Tue, 31 Mar 2026 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983551; cv=none; b=eP2Wwa/9rBF+9dg+SQ6dwex3NWjC6t9fOfPtqCugdl70Etj/7OfTADu5ggvjDYcDQfEKY7u+rweuvbCx4y8gXviJUFH6qICyJURMIx1kGw6SYk0PrN4hd2TpJffA2d/O9NvtVb8N0LgSkN/Ag5UEArw3mVNiH6Dbb9Ov8nQyGYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983551; c=relaxed/simple;
	bh=l1cH7gYvlcc0lSooMVlOy/K8fFgRGPMUfDne5EcSqdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QmsSp8VT/XUCFk+aBr8pBDzGtLzT/FTaVG4b3z7j0qQYxNNbCfovivwHQcJuTQJs6D8qrbX8gUv3o9bgzpmdb4q3C4XIuuMhxq0yAoJaJRIlH/fBZcnUnIqzveX9cuWQ5d0bEVfAbByEihKiYu551WmQQPc2dDIjsB9rSk2HdwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbSK3R5g; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbSK3R5g"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c15849aa2cso6473579eec.0
        for <linux-leds@vger.kernel.org>; Tue, 31 Mar 2026 11:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774983549; x=1775588349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twlo6aN4ZIIizkV5asPjuWxWSEYhM+jPy1SPudDCUoI=;
        b=HbSK3R5gD9d/Fq2ihig09b77i+9HS2EDuIAtB+U7QbEwwvREO+5vbeOto0YPXenQsD
         nMQ552ktCFrjjBkTsYJQNVv40pCpTVcXXj/k+HXmwQ8M+NfousVDrRL/s9NGfVSZAvms
         cwjnvUr3p8zeG5aoQnTpLqYd2dPpIztW1Xmj9SivGNyQqo6g9qusl2Ehvu5JvkPRE5Yd
         VbuA9tGHT1wnnQK+HhLPLIEXxwUR2PXRYdqebEHE+u66oeQL0fp2+VCG3RrlbifcqkoM
         BDz72qV0Z+xNHa5zGSDeXyZZvv4sZC1TB7lHWCBAIT5+nUvz62oy8TA77PLR0AC3q0s8
         hsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983549; x=1775588349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twlo6aN4ZIIizkV5asPjuWxWSEYhM+jPy1SPudDCUoI=;
        b=jXH9CaS4uapyF51bk1xjtdNE9prvt7yB4eEZxfws2FcVbylLFO0XgUi7i/LuOe6ckq
         Molc7cjJt39Bom/ZbdAknMxtqOHGf6EPeU77VxjkQ7bUe2feLCMyC+dD8orhEJRAQp25
         9qlEuXpDiAQoAZvMi74bT25M4Yn1w5gLM8P0Wg4an3PKUckS3TCyq4QhiPR0Wus0PLwP
         fioLVK3q9xIaK1VIYsLDpVXaudaOw1aotR/J9Iy/JG6N+NO2OAARLH4fAyyeNRU3WzsX
         GAMzx4CWNjBQUPNiat8TxtMIpB7ULefN4WutHmJxqC2EmfHomqksHVLWvXCIGqKN1Avf
         y/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMffFeq+LkqrmBLuMDh6AOh514231erMQJ84ewNsv/ucQRIcTv1GTyluvvvWRuyZLLMDPjHPhbe+p2@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8vsxmPMmUfmFKV9mE0+6c/ZbbWf+FIEWeE2ATNrKSghT0aVK
	jjLu86qWXJ8wvw10Fjg+fenBvzAYnHU7thfBT9PpyX9s5P82AVut71AE
X-Gm-Gg: ATEYQzzrKWVMKHVo448dFOyiSBYKnDW0IiO+S8upg9mF1j/XXmMuDpYI/T52CNjFBj4
	4MYRFPPC1znI46lGlX4LVbCj4iXJT8K9Tv6rPZAYDnFYKH4pyQROtquNajZzRFCRM9vEvsdHJbt
	QIvauNFotATQI1xiv4zgAsH2jbS5jgp2Bq/OmOEHMW6k6cEEuWSjpd87Qn8GWUQWS6PsDp3xmJN
	b7giZzBQyYcqdKJ7OIpU+CvDFWSrCBbbfX6F/NWOMCWe+9ak0wT8Uv8JB/JMdA+KAAo47xD2x00
	CYyDh1SBA5FyWSb2GJRK0Bc83MNH6/jEzscRPiZPbH5Q1dWrUaxegSwjFnq+nxLO9rvFyxejDQY
	qJVagCtAr+7SgjZ2J/kLLeoOGBdhrS2N2dTMS536kpR5cALlHk/xtiYbJEmIxoK+8bP96ttuW7/
	Ie4TLCkk2IggWsTuWHCoVtBzOdMGX2ccvW2++IpB0q03L39zMxrJTULCPiEHZoHymWI4tqGuV3o
	Yl4/Q==
X-Received: by 2002:a05:7300:2213:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-2c93078fc9dmr270392eec.2.1774983548956;
        Tue, 31 Mar 2026 11:59:08 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b2c57sm11411406eec.16.2026.03.31.11.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:59:08 -0700 (PDT)
Message-ID: <3435895a-ffd9-4dd3-b21a-4466791183ca@gmail.com>
Date: Tue, 31 Mar 2026 11:59:07 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
 <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
 <xh2un63wi3noruqm6gf2dhayad77kpubalxc4xarmsm6eznvla@g4w2yuxja3c2>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <xh2un63wi3noruqm6gf2dhayad77kpubalxc4xarmsm6eznvla@g4w2yuxja3c2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Dmitry,

>> +	vreg_flash: regulator-flash {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VREG_FLASH_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-0 = <&flash_led_unlock>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>> +	led-controller {
> It looks like the nodes are not sorted. Could you please make sure that
> they are sorted alphanumerically (if there is no node address)?

Thanks for your feedback! Could I request this comment/change be noted 
in 
https://lore.kernel.org/all/20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com/ 
instead? As this seems to be the only comment remaining, it will be 
easier for me to reorganize the DTS in the fuel gauge patch series 
rather than this one, as the fuel gauge patch series depends on this 
one. It also won't spam others in the mailing list who don't care about 
the reorganization of the DTS.


Thanks,

Rudraksha


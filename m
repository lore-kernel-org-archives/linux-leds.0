From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 2/2] documention: leds: Add multicolor class
 documentation
Date: Sun, 9 Jun 2019 17:15:57 +0200
Message-ID: <d5bdf93b-2a6e-a773-ebb1-4850859ed147@gmail.com>
References: <20190530181630.30373-1-dmurphy@ti.com>
 <20190530181630.30373-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------1E09EAE11F5DFB1537256FD3"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530181630.30373-2-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This is a multi-part message in MIME format.
--------------1E09EAE11F5DFB1537256FD3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

On 5/30/19 8:16 PM, Dan Murphy wrote:
[...]
> +Multicolor Class Brightness Control
> +-----------------------------------
> +The multicolor class will redirect the device drivers call back
> +function for brightness control to the multicolor class brightness
> +control function.
> +
> +The brightness level for each LED is calculated based on the color LED
> +brightness setting divided by the color LED max brightness setting multiplied by
> +the requested value.
> +
> +led_brightness = requested_value*(led_color_brightness/led_color_max_brightness)
> +
> +Example:
> +Three LEDs are present in the group as defined in "Directory Layout Example"
> +within this document.
> +
> +A user first writes the color LED brightness file with the brightness level that
> +is neccesary to achieve a blueish violet output from the RGB LED group.
> +
> +echo 138 > /sys/class/leds/rgb:grouped_leds/red/brightness
> +echo 43 > /sys/class/leds/rgb:grouped_leds/green/brightness
> +echo 226 > /sys/class/leds/rgb:grouped_leds/blue/brightness
> +
> +red -
> +	brightness = 138
> +	max_brightness = 255
> +green -
> +	brightness = 43
> +	max_brightness = 255
> +blue -
> +	brightness = 226
> +	max_brightness = 255
> +
> +The user can control the brightness of that RGB group by writing the parent
> +'brightness' control.  Assuming a parent max_brightness of 255 the user may want
> +to dim the LED color group to half.  The user would write a value of 128 to the
> +parent brightness file then the values written to each LED will be adjusted
> +base on this value
> +
> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +255
> +echo 128 > /sys/class/leds/rgb:grouped_leds/brightness
> +
> +adjusted_red_value = 128 * (138/255) = 69
> +adjusted_green_value = 128 * (43/255) = 21
> +adjusted_blue_value = 128 * (226/255) = 113
> +
> +Reading the parent brightness file will return the current brightness value of
> +the color LED group.

I've tested this algorithm with python script and at least on my LED 
monitor it works as expected. Attached is the script I've come up with.

> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +255
> +
> +echo 128 > /sys/class/leds/rgb:grouped_leds/brightness
> +
> +cat /sys/class/leds/rgb:grouped_leds/max_brightness
> +128
> +
> +
> 

-- 
Best regards,
Jacek Anaszewski

--------------1E09EAE11F5DFB1537256FD3
Content-Type: text/x-python;
 name="led_color.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="led_color.py"

#!/usr/bin/python3.5

from PIL import Image
import sys
import time

WIDTH = 500
HEIGHT = 500

def print_usage():
        print ('Usage: led_color.py RED GREEN BLUE TOP_BRIGHTNESS')
        sys.exit(0)

def main():
    if len(sys.argv) != 5:
            print_usage()

    MAX_R = int(sys.argv[4])
    MAX_G = int(sys.argv[4])
    MAX_B = int(sys.argv[4])

    R = int(sys.argv[1])
    G = int(sys.argv[2])
    B = int(sys.argv[3])
    TB = int(sys.argv[4])

    for BR in range(1,TB+1):
        OUT_R = int(BR * R / MAX_R)
        OUT_G = int(BR * G / MAX_G)
        OUT_B = int(BR * B / MAX_B)

        print("red: {}, green: {}, blue: {}".format(OUT_R, OUT_G, OUT_B))

        img = Image.new("RGB", (WIDTH,HEIGHT), (OUT_R,OUT_G,OUT_B))
        img.show()
        time.sleep(0.1)


if __name__ == "__main__":
        main()


--------------1E09EAE11F5DFB1537256FD3--
